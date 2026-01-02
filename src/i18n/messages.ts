import type { Locale } from "@/i18n/locales"

type Messages = Record<string, string>

export const MESSAGES: Record<Locale, Messages> = {
  en: {
    "app.presets": "Presets",
    "app.loadingItems": "Loading items…",
    "filters.searchPlaceholder": "Search name + description…",
    "filters.reset": "Reset",
    "filters.rarity": "Rarity",
    "filters.showingCount": "Showing {showing} / {total} items",
    "filters.currentPresetCount": "Current preset: {count} items",
    "filters.lang.en": "English",
    "filters.lang.zh-CN": "中文",
    "details.fallbackTitle": "Item",
    "details.add": "Add to current preset",
    "details.remove": "Remove from current preset",
    "dock.clear": "Clear",
    "dock.save": "Save",
    "dock.empty": "No items yet.",
    "presets.savedTitle": "Saved presets",
    "presets.empty": "No saved presets yet. Select items, then click Save.",
    "presets.meta": "{count} items • created {date}",
    "presets.defaultPrefix": "Preset",
    "presets.load": "Load",
    "presets.delete": "Delete",
    "presets.itemsEmpty": "Empty.",
    "itemIcon.doubleClickHint": "Double-click for details",
    "saveDialog.title": "Save preset",
    "saveDialog.desc": "Save your current selection ({count} items) to localStorage.",
    "saveDialog.nameLabel": "Name",
    "common.cancel": "Cancel",
    "common.save": "Save",
    "share.share": "Share",
    "share.copied": "Share link copied, paste it to address bar to open",
    "share.copyFailed": "Failed to copy share link",
    "shared.title": "Shared preset",
    "shared.desc": "You’re viewing a shared preset. You can preview it first, then save it to your presets.",
    "shared.itemsMeta": "{known} items • {unknown} unknown",
    "shared.noValidItems": "No valid items found in this share link.",
    "shared.saveToMyPresets": "Save to my presets",
    "shared.close": "Close",
  },
  "zh-CN": {
    "app.presets": "预设",
    "app.loadingItems": "正在加载物品…",
    "filters.searchPlaceholder": "搜索名称 + 描述…",
    "filters.reset": "重置",
    "filters.rarity": "稀有度",
    "filters.showingCount": "显示 {showing} / {total} 个物品",
    "filters.currentPresetCount": "当前预设：{count} 个物品",
    "filters.lang.en": "English",
    "filters.lang.zh-CN": "中文",
    "details.fallbackTitle": "物品",
    "details.add": "加入当前预设",
    "details.remove": "从当前预设移除",
    "dock.clear": "清空",
    "dock.save": "保存",
    "dock.empty": "还没有选择任何物品。",
    "presets.savedTitle": "已保存的预设",
    "presets.empty": "还没有保存的预设。先选择物品，然后点击“保存”。",
    "presets.meta": "{count} 个物品 • 创建于 {date}",
    "presets.defaultPrefix": "预设",
    "presets.load": "载入",
    "presets.delete": "删除",
    "presets.itemsEmpty": "空。",
    "itemIcon.doubleClickHint": "双击查看详情",
    "saveDialog.title": "保存预设",
    "saveDialog.desc": "将当前选择（{count} 个物品）保存到 localStorage。",
    "saveDialog.nameLabel": "名称",
    "common.cancel": "取消",
    "common.save": "保存",
    "share.share": "分享",
    "share.copied": "已复制分享链接，粘贴到地址栏打开",
    "share.copyFailed": "分享链接生成失败",
    "shared.title": "分享的预设",
    "shared.desc": "你正在查看一个分享的预设。你可以先预览，然后保存到本地预设。",
    "shared.itemsMeta": "{known} 个物品 • {unknown} 个未知",
    "shared.noValidItems": "该分享链接中没有可用的物品。",
    "shared.saveToMyPresets": "保存到我的预设",
    "shared.close": "关闭",
  },
}

export function formatMessage(template: string, params?: Record<string, string | number>) {
  if (!params) return template
  return template.replace(/\{(\w+)\}/g, (_, k: string) => {
    const v = params[k]
    return v === undefined || v === null ? `{${k}}` : String(v)
  })
}


