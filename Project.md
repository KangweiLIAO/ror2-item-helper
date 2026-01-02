下面是一份**简短、工程导向、可直接丢给 Coding Agent 开工的项目需求（PRD-lite）**。我刻意写成“可执行指令 + 明确边界”，避免歧义。

---

# Project: RoR2 Items Preset Browser

## Goal

构建一个 **更好用、可分享的 Risk of Rain 2 Items 浏览器**，支持用户选择 Items 并保存为 **Preset**，方便以后快速查看和分享。

---

## Core Features (MVP)

### 1. Items 浏览

* 展示所有 Items（图标 grid 形式）
* 每个 item 至少包含：

  * `id`
  * `name`
  * `icon`
  * `description`
  * `rarity`
* 支持 **hover / click 查看详情**

  * 桌面端：hover tooltip
  * 移动端：click 打开详情面板

### 2. Item 选择

* 用户可 **多选 items**
* 被选中的 items 有明显状态（高亮 / badge / check）
* 支持一键清空选择

### 3. Preset（核心）

* Preset 数据结构：

  * `id`
  * `name`
  * `itemIds[]`
  * `createdAt`
* 功能：

  * 保存当前选择为 Preset
  * 查看 Preset 列表
  * 点击 Preset → 还原 items 选择状态
  * 删除 Preset

### 4. 本地存储

* Preset 使用 `localStorage` 持久化
* 刷新页面不丢失数据

### 5. 分享 Preset（无后端）

* 支持通过 **URL 分享 Preset**
* 方案：

  * 将 preset JSON 压缩（如 base64 / lz-string）
  * 放入 URL query / hash
* 打开分享链接后：

  * 自动解析 preset
  * 进入“只读 Preset 视图”或直接加载为当前选择

---

## Tech Stack (建议，非强制)

* Framework: **Next.js (App Router)**
* Language: **TypeScript**
* Styling: **Tailwind CSS**
* UI: 自写 or shadcn/ui
* State: React state + localStorage
* No backend required for MVP

---

## Data & Assets

### Items 数据

* 使用本地静态 `public/data/items.json`
* **已实现：** 提供脚本从 RoR2 wiki 拉取 Lua 模块数据，解析后生成 `public/data/items.json`
* 当前 `items.json` 字段（示例，可能随 wiki 变更）：

  ```json
  {
    "name": "Soldier's Syringe",
    "rarity": "Common",
    "description": "...",
    "icon": "/icons/Soldier's Syringe.png",
    "internalName": "Syringe",
    "categories": ["Damage"],
    "stats": [{ "stat": "Attack Speed", "value": "15%", "stack": "Linear", "add": "+15%" }]
  }
  ```

* 生成方式：
  * `npm run fetch-items`
  * 依赖：`fengari`（用于执行/解析 wiki Lua 模块）

### Icons

* 图标存放在 `/public/icons/`
* **已实现：** `grep_icons.py` 从 wiki 批量下载 icons 并生成映射 `public/items-assets.json`
  * 支持：
    * 从 `Category:Item_Icons` 拉取全量文件
    * 从 `public/data/items.json` 读取 item name，并尝试补齐缺失图标（File: 直连 + 搜索兜底）
* 前端只消费本地资源，不 hotlink

#### 更新 icons / 映射（命令）

```bash
python grep_icons.py --only-missing
```

可选参数：
* `--overwrite`：强制重新下载
* `--rate 0.2`：请求间隔（避免触发站点限流）

---

## Non-Goals (MVP 不做)

* 登录 / 账号系统
* 云端同步
* 商业化 / 广告
* 构建模拟 / 数值计算

---

## UX Notes

* 快速扫图优先（图标密度高）
* Preset 操作应 ≤ 2 步完成
* 分享链接应“点开即看到结果”，不需要额外操作

---

## Deliverables

* 可部署的前端项目
* 清晰的组件拆分（ItemsGrid / ItemCard / PresetManager）
* README：如何更新 items 数据 & icons

---

## Current Implementation Status (as of 2026-01-01)

### 已完成（数据管线）

* `scripts/fetch-items-data.mjs`
  * 从 wiki 下载 Items Lua module
  * 使用 `fengari` 执行 Lua 并提取 `p.items`
  * 生成 `public/data/items.json`
  * 根据 `public/items-assets.json` 为条目补充 `icon` 路径（如 `/icons/Foo.png`）
* `grep_icons.py`
  * 下载 `Category:Item_Icons` 图标到 `public/icons/`
  * 更新/补齐 `public/items-assets.json`

### 已完成（前端 UI：MVP 主流程）

* **Items 浏览（主视图）**
  * Top bar：**name+description** 搜索（case-insensitive substring）
  * **rarity 多选过滤**（checkbox）
  * Items grid：图标网格 + **rarity 颜色边框 + glow**
  * **默认排序**：按 rarity 优先（Common → Uncommon → Legendary → Boss → Lunar → Void → 其他），同 rarity 内按 name A→Z
  * 桌面端 hover：tooltip 展示 **name + 3 行 description**
  * 详情查看：
    * **移动端：点击图标 → bottom sheet 详情 + Add/Remove**
    * **桌面端：双击图标 → dialog 详情 + Add/Remove**

* **Item 选择（Current preset）**
  * 桌面端：点击图标 **select/unselect**
  * 底部 dock 展示当前已选 items（横向滚动），支持：
    * 单个移除（x）
    * 清空（Clear）

* **Preset（localStorage）**
  * Preset 结构：`id/name/itemIds/createdAt`
  * Presets bottom sheet：
    * 列表查看 saved presets
    * **Load：替换当前 selection（replace，不 merge）并自动关闭 sheet**
    * Rename / Delete
    * 直接编辑 preset items：点击每个 item 的 **x** 移除
    * 桌面端支持从 grid **drag 到 preset 卡片**以添加 item

* **健壮性/数据清洗**
  * 处理 `items.json` 中 `internalName: null`：前端会为 item 生成稳定 `id`（避免 React key 冲突）
  * **移除无 description 的 items**（不会出现在 UI 中）

### ⏳ 未开始 / 待实现

* **URL 分享 Preset**

### ✅ 已完成（中文本地化 / zh-CN）

* **语言切换**
  * 支持通过 URL query：`?lang=en` / `?lang=zh-CN`
  * 当 URL 缺省时：跟随浏览器语言，并自动写回 `lang` 到 URL（方便分享链接保持语言）
  * 顶部 Filters bar 提供语言切换按钮（English / 中文）

* **UI 文案**
  * 已完成主要 UI 文案中文化（搜索、重置、稀有度、计数、Preset 相关按钮/提示等）

* **Items 名称 + 描述**
  * `?lang=zh-CN` 时展示中文 item `name/description`（桌面 hover tooltip、移动端详情 sheet、桌面详情 dialog 全覆盖）
  * 翻译数据来源：基于 fandom 的英文描述做逐条中文翻译（可继续人工微调）
  * 翻译文件：`public/data/items.zh-CN.overrides.json`（按 item `id`/`internalName` 做 key）
