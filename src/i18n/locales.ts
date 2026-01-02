export const SUPPORTED_LOCALES = ["en", "zh-CN"] as const
export type Locale = (typeof SUPPORTED_LOCALES)[number]

export function isLocale(input: string | null | undefined): input is Locale {
  return SUPPORTED_LOCALES.includes(input as Locale)
}

export function normalizeLocale(input: string | null | undefined): Locale | null {
  if (!input) return null
  // accept common variants
  if (input === "zh" || input.toLowerCase() === "zh-cn" || input.toLowerCase() === "zh_hans") return "zh-CN"
  if (input.toLowerCase() === "en-us" || input.toLowerCase() === "en-gb") return "en"
  return isLocale(input) ? input : null
}

export function inferBrowserLocale(): Locale {
  if (typeof navigator === "undefined") return "en"
  const lang = navigator.language || ""
  return normalizeLocale(lang) ?? (lang.toLowerCase().startsWith("zh") ? "zh-CN" : "en")
}


