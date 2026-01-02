"use client"

import * as React from "react"

import type { Locale } from "@/i18n/locales"
import type { Ror2ItemRaw, UiItem } from "@/lib/ror2-items"
import { normalizeItems } from "@/lib/ror2-items"

type OverridesMap = Record<string, Partial<Pick<UiItem, "name" | "description">>>

async function fetchOverrides(locale: Locale): Promise<OverridesMap | null> {
  if (locale !== "zh-CN") return null
  try {
    // We want edits to the translation file to reflect immediately during development.
    // (Using force-cache can make the UI appear "stuck" in English until a hard refresh.)
    const res = await fetch("/data/items.zh-CN.overrides.json", { cache: "no-store" })
    if (!res.ok) return null
    const data = (await res.json()) as unknown
    if (!data || typeof data !== "object" || Array.isArray(data)) return null
    return data as OverridesMap
  } catch {
    return null
  }
}

export function useItemsData(locale: Locale = "en") {
  const [items, setItems] = React.useState<UiItem[]>([])
  const [error, setError] = React.useState<string | null>(null)
  const [loading, setLoading] = React.useState(true)

  React.useEffect(() => {
    let cancelled = false
    async function run() {
      try {
        setLoading(true)
        setError(null)
        // We want data pipeline updates (items+equipments) to reflect without requiring a hard refresh.
        // In dev, `force-cache` can make the UI appear "stuck" on an older items.json.
        const cache = process.env.NODE_ENV === "development" ? "no-store" : "force-cache"
        const res = await fetch("/data/items.json", { cache })
        if (!res.ok) throw new Error(`Failed to load items.json (${res.status})`)
        const data = (await res.json()) as Ror2ItemRaw[]
        if (cancelled) return
        const base = normalizeItems(Array.isArray(data) ? data : [])
        const overrides = await fetchOverrides(locale)
        if (cancelled) return
        if (locale !== "zh-CN") {
          setItems(base)
          return
        }
        const localized = base.map((it) => {
          const ov = overrides?.[it.id]
          const nextName = typeof ov?.name === "string" && ov.name.trim() ? ov.name : it.name
          const nextDesc = typeof ov?.description === "string" && ov.description.trim() ? ov.description : it.description
          return { ...it, name: nextName, description: nextDesc }
        })
        setItems(localized)
      } catch (e) {
        if (cancelled) return
        setItems([])
        setError(e instanceof Error ? e.message : "Failed to load items")
      } finally {
        if (!cancelled) setLoading(false)
      }
    }
    run()
    return () => {
      cancelled = true
    }
  }, [locale])

  return { items, error, loading }
}


