## RoR2 Items Helper (Preset Browser)

A fast, shareable **Risk of Rain 2 item browser** that lets you pick items, save them as **presets**, and share presets via URL — **no backend required**.

### Features

- **Browse items**: icon grid + quick search (name/description) + rarity filters
- **Item details**:
  - Desktop: hover tooltip; double-click opens a details dialog
  - Mobile: tap opens a bottom sheet with details
- **Presets (localStorage)**:
  - Save current selection as a preset
  - Load (replace current selection), rename, delete
  - Edit preset items directly (remove items)
  - Desktop: drag items from grid onto a preset card to add
- **Share presets via URL (no backend)**:
  - Format: `/?share=<itemId>&share=<itemId>...`
  - Opening a share link shows a preview dialog; user can import into local presets
  - After import, the app removes `share` params to avoid repeated popups
- **Localization**:
  - `?lang=en` or `?lang=zh-CN`
  - If missing, follows browser language and writes `lang` into the URL for shareability
  - zh-CN item name/description overrides live in `public/data/items.zh-CN.overrides.json`

### Tech Stack

- **Next.js** (App Router) + **React** + **TypeScript**
- **Tailwind CSS**
- **Radix UI** primitives + small UI helpers

### Attribution

Item data and icons are sourced from the Risk of Rain 2 Wiki (Fandom)  
https://riskofrain2.fandom.com/

Wiki content is community-contributed and licensed under CC BY-NC-SA, unless otherwise noted.
This is a non-commercial, fan-made project and is not affiliated with Fandom or the game’s developers.

### Updating item data + icons (pipeline)

Run:

```bash
npm run fetch-items
```

This will:
- Download the wiki Lua module to `data/items_data.lua`
- Download the wiki Lua module to `data/equipment_data.lua`
- Refresh local icons in `public/icons/` and update `public/items-assets.json`
- Generate `public/data/items.json` with `icon` paths (items + equipments)

### Deploying on Vercel (fetch new data every build)

This repo includes a `vercel-build` script, so **Vercel will run `npm run fetch-items` on every deployment build automatically**.

If you have a custom Vercel **Build Command** set in the dashboard, remove it (or set it to `npm run vercel-build`) so it doesn't bypass the `vercel-build` script.

Useful flags (passed after `--`):

```bash
# Faster: skip bulk category crawl, only try resolving missing icons by item name
npm run fetch-items -- --no-category

# Skip all icon network work (still attaches icons from existing mapping)
npm run fetch-items -- --no-icons
```
