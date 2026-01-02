import fs from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import fengari from "fengari";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const PROJECT_ROOT = join(__dirname, "..");

const RAW_URL = "https://riskofrain2.fandom.com/wiki/Module:Items/Data?action=raw";

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
  console.log("Fetching items data from wiki...");
  
  const res = await fetch(RAW_URL, {
    headers: { "user-agent": "ror2-items-browser/0.1 (personal project)" },
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

  // Load icon mapping
  const iconMapPath = join(PROJECT_ROOT, "public/items-assets.json");
  const iconMapText = await fs.readFile(iconMapPath, "utf8");
  const iconMap = JSON.parse(iconMapText);
  console.log(`✓ Loaded ${Object.keys(iconMap).length} icon mappings`);

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
  const outputPath = join(PROJECT_ROOT, "public/data/items.json");
  await fs.mkdir(join(PROJECT_ROOT, "public/data"), { recursive: true });
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
