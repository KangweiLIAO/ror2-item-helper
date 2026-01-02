import type { Locale } from "@/i18n/locales"

const ZH_RARITY: Record<string, string> = {
  Common: "普通",
  Uncommon: "罕见",
  Legendary: "传奇",
  Boss: "Boss",
  Lunar: "月球",
  Void: "虚空",
  Equipment: "装备",
  "Lunar Equipment": "月球装备",
  "Elite Equipment": "精英装备",
  Unknown: "未知",
}

export function rarityLabel(locale: Locale, rarity: string) {
  if (locale !== "zh-CN") return rarity
  return ZH_RARITY[rarity] ?? rarity
}


