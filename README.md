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
