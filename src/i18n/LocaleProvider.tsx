"use client"

import * as React from "react"
import { usePathname, useRouter, useSearchParams } from "next/navigation"

import type { Locale } from "@/i18n/locales"
import { inferBrowserLocale, normalizeLocale } from "@/i18n/locales"
import { MESSAGES, formatMessage } from "@/i18n/messages"
import { getShareIds } from "@/lib/share"

type I18nContextValue = {
  locale: Locale
  setLocale: (next: Locale) => void
  t: (key: string, params?: Record<string, unknown>) => string
}

const I18nContext = React.createContext<I18nContextValue | null>(null)

function buildSearchWithLang(current: URLSearchParams, nextLocale: Locale) {
  const sp = new URLSearchParams(current)
  sp.set("lang", nextLocale)
  return `?${sp.toString()}`
}

export function LocaleProvider({ children }: { children: React.ReactNode }) {
  const searchParams = useSearchParams()
  const router = useRouter()
  const pathname = usePathname()

  const [locale, setLocaleState] = React.useState<Locale>(() => {
    const fromQuery = normalizeLocale(searchParams.get("lang"))
    return fromQuery ?? inferBrowserLocale()
  })

  // Keep locale in sync with ?lang= changes (e.g. user pastes a URL).
  React.useEffect(() => {
    const fromQuery = normalizeLocale(searchParams.get("lang"))
    if (fromQuery && fromQuery !== locale) setLocaleState(fromQuery)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [searchParams])

  // If URL is missing/invalid lang, write a stable one so share links preserve language.
  React.useEffect(() => {
    // IMPORTANT: For share links, we do NOT auto-write ?lang= into the URL.
    // Otherwise a user opening a share link would "language-lock" it when they copy the URL.
    if (getShareIds(searchParams).length > 0) return
    const fromQuery = normalizeLocale(searchParams.get("lang"))
    if (fromQuery) return
    const inferred = inferBrowserLocale()
    setLocaleState(inferred)
    router.replace(`${pathname}${buildSearchWithLang(searchParams, inferred)}`)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const setLocale = React.useCallback(
    (next: Locale) => {
      setLocaleState(next)
      router.replace(`${pathname}${buildSearchWithLang(searchParams, next)}`)
    },
    [pathname, router, searchParams]
  )

  const t = React.useCallback(
    (key: string, params?: Record<string, unknown>) => {
      const template = MESSAGES[locale]?.[key] ?? MESSAGES.en[key] ?? key
      return formatMessage(template, params)
    },
    [locale]
  )

  const value = React.useMemo<I18nContextValue>(() => ({ locale, setLocale, t }), [locale, setLocale, t])

  return <I18nContext.Provider value={value}>{children}</I18nContext.Provider>
}

export function useI18n() {
  const ctx = React.useContext(I18nContext)
  if (!ctx) throw new Error("useI18n must be used within <LocaleProvider>")
  return ctx
}


