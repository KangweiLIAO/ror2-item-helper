import fs from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import fengari from "fengari";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const PROJECT_ROOT = join(__dirname, "..");

const RAW_URL = "https://riskofrain2.fandom.com/wiki/Module:Items/Data?action=raw";

const WIKI = "https://riskofrain2.fandom.com";
const API = `${WIKI}/api.php`;
const DEFAULT_OUT_DIR = "public/icons";
const DEFAULT_MAPPING_FILE = "public/items-assets.json";
const DEFAULT_ITEMS_JSON = "public/data/items.json";
const DEFAULT_CATEGORY = "Category:Item_Icons";

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms));
}

function normalizeFsPath(p) {
  // Keep mapping JSON stable across OS (forward slashes)
  return p.replace(/\\/g, "/");
}

function parseArgs(argv) {
  const args = {
    outDir: DEFAULT_OUT_DIR,
    mappingFile: DEFAULT_MAPPING_FILE,
    itemsJson: DEFAULT_ITEMS_JSON,
    category: DEFAULT_CATEGORY,
    onlyMissing: true,
    overwrite: false,
    rate: 0.2,
    icons: true,
    categoryCrawl: true,
    fillMissing: true,
  };

  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];

    if (a === "--out-dir") args.outDir = argv[++i];
    else if (a === "--mapping-file") args.mappingFile = argv[++i];
    else if (a === "--items-json") args.itemsJson = argv[++i];
    else if (a === "--category") args.category = argv[++i];
    else if (a === "--rate") args.rate = Number(argv[++i]);
    else if (a === "--overwrite") args.overwrite = true;
    else if (a === "--only-missing") args.onlyMissing = true;
    else if (a === "--no-only-missing") args.onlyMissing = false;
    else if (a === "--no-icons") args.icons = false;
    else if (a === "--no-category") args.categoryCrawl = false;
    else if (a === "--no-fill-missing") args.fillMissing = false;
    else if (a === "--help" || a === "-h") {
      console.log(`
Usage: node scripts/fetch-items-data.mjs [options]

Fetch + parse items from the RoR2 wiki, refresh local icons (optional), then write:
- data/items_data.lua
- public/items-assets.json
- public/data/items.json

Options:
  --out-dir <dir>           Icon output dir (default: ${DEFAULT_OUT_DIR})
  --mapping-file <file>     Icon mapping JSON (default: ${DEFAULT_MAPPING_FILE})
  --items-json <file>       Output items JSON path (default: ${DEFAULT_ITEMS_JSON})
  --category <title>        Wiki category for bulk icon crawl (default: ${DEFAULT_CATEGORY})
  --rate <seconds>          Sleep between requests (default: 0.2)
  --overwrite               Re-download icons even if file exists
  --only-missing / --no-only-missing
                            Only resolve per-item icons if missing in mapping (default: only-missing)
  --no-icons                Skip all icon fetching/downloading (still attaches from existing mapping)
  --no-category             Skip bulk category crawl (faster; relies on per-item lookup)
  --no-fill-missing          Skip per-item lookup for missing icons
`);
      process.exit(0);
    }
  }

  return args;
}

async function apiGet(params, { userAgent }) {
  const u = new URL(API);
  for (const [k, v] of Object.entries({ ...params, format: "json", formatversion: 2 })) {
    u.searchParams.set(k, String(v));
  }

  const res = await fetch(u, {
    headers: { "user-agent": userAgent },
  });
  if (!res.ok) throw new Error(`MediaWiki API failed: ${res.status} ${res.statusText}`);
  return await res.json();
}

async function listCategoryFiles(categoryTitle, { userAgent, rateSeconds }) {
  const files = [];
  let cont = null;
  while (true) {
    const params = {
      action: "query",
      list: "categorymembers",
      cmtitle: categoryTitle,
      cmnamespace: 6, // File:
      cmlimit: 500,
    };
    if (cont) params.cmcontinue = cont;

    const data = await apiGet(params, { userAgent });
    files.push(...(data?.query?.categorymembers ?? []).map((x) => x.title));

    cont = data?.continue?.cmcontinue ?? null;
    if (!cont) break;
    await sleep(rateSeconds * 1000);
  }
  return files;
}

async function getImageUrl(title, { userAgent }) {
  const data = await apiGet(
    {
      action: "query",
      titles: title,
      prop: "imageinfo",
      iiprop: "url",
    },
    { userAgent }
  );
  const page = data?.query?.pages?.[0];
  const url = page?.imageinfo?.[0]?.url ?? null;
  return url;
}

async function searchFileTitles(query, { userAgent, limit = 5 }) {
  const data = await apiGet(
    {
      action: "query",
      list: "search",
      srsearch: query,
      srnamespace: 6, // File:
      srlimit: limit,
    },
    { userAgent }
  );
  return (data?.query?.search ?? []).map((x) => x.title);
}

async function resolveItemIcon(itemName, { userAgent }) {
  const directTitles = [
    `File:${itemName}.png`,
    `File:${itemName}.jpg`,
    `File:${itemName}.jpeg`,
    `File:${itemName}.webp`,
  ];

  for (const t of directTitles) {
    const url = await getImageUrl(t, { userAgent });
    if (url) return { filename: t.replace(/^File:/, ""), url };
  }

  const candidates1 = await searchFileTitles(`intitle:"${itemName}"`, {
    userAgent,
    limit: 10,
  });
  for (const t of candidates1) {
    const url = await getImageUrl(t, { userAgent });
    if (!url) continue;
    const filename = t.replace(/^File:/, "");
    if (filename.toLowerCase().endsWith(".png")) return { filename, url };
  }

  const candidates2 = await searchFileTitles(itemName, { userAgent, limit: 10 });
  for (const t of candidates2) {
    const url = await getImageUrl(t, { userAgent });
    if (!url) continue;
    const filename = t.replace(/^File:/, "");
    if (filename.toLowerCase().endsWith(".png")) return { filename, url };
  }

  return null;
}

async function download(url, outPath, { overwrite, userAgent }) {
  try {
    if (!overwrite) {
      await fs.access(outPath);
      return;
    }
  } catch {
    // fall through
  }

  const res = await fetch(url, { headers: { "user-agent": userAgent } });
  if (!res.ok) throw new Error(`Download failed: ${res.status} ${res.statusText} (${url})`);
  const buf = Buffer.from(await res.arrayBuffer());
  await fs.mkdir(dirname(outPath), { recursive: true });
  await fs.writeFile(outPath, buf);
}

async function loadJsonOrDefault(path, defaultValue) {
  try {
    const t = await fs.readFile(path, "utf8");
    return JSON.parse(t);
  } catch {
    return defaultValue;
  }
}

async function saveMapping(mappingFileAbs, mapping) {
  const sorted = {};
  for (const k of Object.keys(mapping).sort((a, b) => a.localeCompare(b))) {
    sorted[k] = mapping[k];
  }
  await fs.mkdir(dirname(mappingFileAbs), { recursive: true });
  await fs.writeFile(mappingFileAbs, JSON.stringify(sorted, null, 2) + "\n", "utf8");
}

/**
 * Helpers for reading values off the Lua stack safely
 */
function luaStackToJsString(L, idx) {
  const { lua, to_jsstring } = fengari;
  const jsStr = lua.lua_tojsstring(L, idx);
  if (jsStr !== null) return jsStr;
  const luaStr = lua.lua_tostring(L, idx);
  if (luaStr === null) return null;
  return to_jsstring(luaStr);
}

function luaGetStringField(L, tableIdx, fieldName) {
  const { lua, to_luastring } = fengari;
  lua.lua_getfield(L, tableIdx, to_luastring(fieldName));
  const v = luaStackToJsString(L, -1);
  lua.lua_pop(L, 1);
  return v;
}

function luaGetStringArrayField(L, tableIdx, fieldName) {
  const { lua, to_luastring } = fengari;
  lua.lua_getfield(L, tableIdx, to_luastring(fieldName));
  if (!lua.lua_istable(L, -1)) {
    lua.lua_pop(L, 1);
    return [];
  }

  const arrIdx = lua.lua_absindex(L, -1);
  const len = lua.lua_rawlen(L, arrIdx);
  const out = [];
  for (let i = 1; i <= len; i++) {
    lua.lua_geti(L, arrIdx, i);
    const s = luaStackToJsString(L, -1);
    if (s !== null) out.push(s);
    lua.lua_pop(L, 1);
  }

  lua.lua_pop(L, 1);
  return out;
}

function luaGetStatsField(L, tableIdx) {
  const { lua, to_luastring } = fengari;
  lua.lua_getfield(L, tableIdx, to_luastring("Stats"));
  if (!lua.lua_istable(L, -1)) {
    lua.lua_pop(L, 1);
    return [];
  }

  const statsIdx = lua.lua_absindex(L, -1);
  const len = lua.lua_rawlen(L, statsIdx);
  const out = [];
  for (let i = 1; i <= len; i++) {
    lua.lua_geti(L, statsIdx, i);
    if (!lua.lua_istable(L, -1)) {
      lua.lua_pop(L, 1);
      continue;
    }
    const statRowIdx = lua.lua_absindex(L, -1);
    out.push({
      stat: luaGetStringField(L, statRowIdx, "Stat"),
      value: luaGetStringField(L, statRowIdx, "Value"),
      stack: luaGetStringField(L, statRowIdx, "Stack"),
      add: luaGetStringField(L, statRowIdx, "Add"),
    });
    lua.lua_pop(L, 1);
  }

  lua.lua_pop(L, 1);
  return out;
}

/**
 * Parse Lua module using fengari
 */
function parseLuaTable(luaText) {
  const { lua, lauxlib, lualib, to_luastring } = fengari;
  
  const L = lauxlib.luaL_newstate();
  lualib.luaL_openlibs(L);
  
  // Execute the Lua code
  const status = lauxlib.luaL_dostring(L, to_luastring(luaText));
  if (status !== lua.LUA_OK) {
    const error =
      lua.lua_tojsstring(L, -1) || lua.lua_typename(L, lua.lua_type(L, -1));
    lua.lua_pop(L, 1);
    lua.lua_close(L);
    throw new Error(`Lua execution error: ${error}`);
  }
  
  // The module should return a table 'p' with p.items
  // Get the returned value from the stack (should be at -1)
  if (!lua.lua_istable(L, -1)) {
    lua.lua_close(L);
    throw new Error("Lua module did not return a table");
  }
  
  // Access p.items
  lua.lua_getfield(L, -1, to_luastring("items"));
  if (!lua.lua_istable(L, -1)) {
    lua.lua_close(L);
    throw new Error("Module table does not contain 'items' field");
  }
  
  // Iterate the items table and extract fields we care about (avoid deep lua_next recursion)
  const items = [];
  const itemsTableIdx = lua.lua_absindex(L, -1);
  lua.lua_pushnil(L);
  while (lua.lua_next(L, itemsTableIdx) !== 0) {
    // key: -2, value (item table): -1
    const itemName = luaStackToJsString(L, -2);
    if (itemName === null || !lua.lua_istable(L, -1)) {
      lua.lua_pop(L, 1); // pop value, keep key
      continue;
    }

    const itemTableIdx = lua.lua_absindex(L, -1);
    const rarity = luaGetStringField(L, itemTableIdx, "Rarity");
    const quote = luaGetStringField(L, itemTableIdx, "Quote");
    const desc = luaGetStringField(L, itemTableIdx, "Desc");
    const internalName = luaGetStringField(L, itemTableIdx, "InternalName");
    const localizationInternalName = luaGetStringField(
      L,
      itemTableIdx,
      "LocalizationInternalName"
    );
    const unlock = luaGetStringField(L, itemTableIdx, "Unlock");
    const corrupt = luaGetStringField(L, itemTableIdx, "Corrupt");
    const categories = luaGetStringArrayField(L, itemTableIdx, "Category");
    const stats = luaGetStatsField(L, itemTableIdx);

    items.push({
      name: itemName,
      rarity,
      quote,
      description: desc,
      internalName,
      localizationInternalName,
      unlock,
      corrupt,
      categories,
      stats,
    });

    lua.lua_pop(L, 1); // pop value, keep key for lua_next
  }

  // pop items table
  lua.lua_pop(L, 1);

  lua.lua_close(L);
  return items;
}

/**
 * Match item names with icon filenames
 * Handles variations in naming (e.g., "57 Leaf Clover" vs "57 Leaf Clover.png")
 */
function findIconForItem(itemName, iconMap) {
  // Try exact match first
  const exactKey = `${itemName}.png`;
  if (iconMap[exactKey]) {
    return iconMap[exactKey].replace(/^public\//, "/"); // Convert to web path
  }
  
  // Try case-insensitive match
  for (const [iconKey, iconPath] of Object.entries(iconMap)) {
    const iconName = iconKey.replace(/\.png$/, "");
    if (iconName.toLowerCase() === itemName.toLowerCase()) {
      return iconPath.replace(/^public\//, "/");
    }
  }
  
  // Try partial match (for items with variations)
  const itemNameLower = itemName.toLowerCase();
  for (const [iconKey, iconPath] of Object.entries(iconMap)) {
    const iconName = iconKey.replace(/\.png$/, "").toLowerCase();
    if (iconName.includes(itemNameLower) || itemNameLower.includes(iconName)) {
      return iconPath.replace(/^public\//, "/");
    }
  }
  
  return null;
}

async function main() {
  const args = parseArgs(process.argv.slice(2));
  const userAgent = "ror2-items-helper/0.1 (personal project)";

  console.log("Fetching items data from wiki...");
  
  const res = await fetch(RAW_URL, {
    headers: { "user-agent": userAgent },
  });
  if (!res.ok) throw new Error(`Fetch failed: ${res.status} ${res.statusText}`);
  const luaText = await res.text();

  // Save raw Lua for debugging
  await fs.mkdir(join(PROJECT_ROOT, "data"), { recursive: true });
  await fs.writeFile(
    join(PROJECT_ROOT, "data/items_data.lua"),
    luaText,
    "utf8"
  );
  console.log("✓ Downloaded Lua module to data/items_data.lua");

  // Parse Lua data
  console.log("Parsing Lua data...");
  let items;
  try {
    items = parseLuaTable(luaText);
    console.log(`✓ Parsed ${items.length} items from Lua`);
  } catch (error) {
    console.error("Error parsing Lua:", error.message);
    console.log("\nNote: If parsing fails, you may need to use fengari for full Lua support.");
    console.log("Install: npm install --save-dev fengari");
    throw error;
  }

  // Load icon mapping (and optionally refresh it)
  const iconMapPath = join(PROJECT_ROOT, args.mappingFile);
  const iconMap = await loadJsonOrDefault(iconMapPath, {});
  console.log(`✓ Loaded ${Object.keys(iconMap).length} icon mappings`);

  if (args.icons) {
    const outDirAbs = join(PROJECT_ROOT, args.outDir);

    if (args.categoryCrawl) {
      console.log(`Refreshing icons from wiki category: ${args.category}`);
      const files = await listCategoryFiles(args.category, {
        userAgent,
        rateSeconds: args.rate,
      });
      console.log(`✓ Found ${files.length} files in category`);

      let crawled = 0;
      for (const title of files) {
        const url = await getImageUrl(title, { userAgent });
        if (!url) continue;
        const filename = title.replace(/^File:/, "");
        const outPath = join(outDirAbs, filename);
        await download(url, outPath, { overwrite: args.overwrite, userAgent });
        iconMap[filename] = normalizeFsPath(join(args.outDir, filename));
        crawled++;
        await sleep(args.rate * 1000);
      }
      console.log(`✓ Category refresh complete (${crawled} icons updated/confirmed)`);
    }

    if (args.fillMissing) {
      console.log("Filling missing icons by item name...");
      let resolvedCount = 0;
      for (const item of items) {
        const name = item?.name;
        if (typeof name !== "string" || !name.trim()) continue;

        const key = `${name}.png`;
        if (args.onlyMissing && iconMap[key]) continue;

        const resolved = await resolveItemIcon(name.trim(), { userAgent });
        if (!resolved) continue;

        const outPath = join(outDirAbs, resolved.filename);
        await download(resolved.url, outPath, { overwrite: args.overwrite, userAgent });
        iconMap[resolved.filename] = normalizeFsPath(join(args.outDir, resolved.filename));
        resolvedCount++;
        await sleep(args.rate * 1000);
      }
      console.log(`✓ Filled ${resolvedCount} missing icons via per-item lookup`);
    }

    await saveMapping(iconMapPath, iconMap);
    console.log(`✓ Wrote icon mapping -> ${args.mappingFile}`);
  } else {
    console.log("Skipping icon fetching/downloading (--no-icons)");
  }

  // Match items with icons
  console.log("Matching items with icons...");
  let matchedCount = 0;
  for (const item of items) {
    const iconPath = findIconForItem(item.name, iconMap);
    if (iconPath) {
      item.icon = iconPath;
      matchedCount++;
    } else {
      console.warn(`⚠ No icon found for: ${item.name}`);
    }
  }
  console.log(`✓ Matched ${matchedCount}/${items.length} items with icons`);

  // Write JSON output
  const outputPath = join(PROJECT_ROOT, args.itemsJson);
  await fs.mkdir(dirname(outputPath), { recursive: true });
  await fs.writeFile(
    outputPath,
    JSON.stringify(items, null, 2),
    "utf8"
  );
  console.log(`✓ Wrote ${items.length} items to ${outputPath}`);
  console.log("\nDone! Items data is ready to use.");
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
