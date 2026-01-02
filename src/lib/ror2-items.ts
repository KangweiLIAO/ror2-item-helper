export type Ror2ItemRaw = {
  name: string | null
  rarity: string | null
  quote?: string | null
  description: string | null
  internalName: string | null
  localizationInternalName?: string | null
  unlock?: string | null
  corrupt?: string | null
  type?: "item" | "equipment" | null
  cooldown?: number | null
  duration?: number | null
  droppable?: boolean | null
  categories?: string[] | null
  stats?: Array<{ stat: string; value: string; stack?: string; add?: string }> | null
  icon: string | null
}

export type UiItem = {
  /** Stable unique id. Prefer `internalName`, fallback to localization/name/index. */
  id: string
  type: "item" | "equipment"
  name: string
  rarity: string
  description: string
  internalName: string | null
  localizationInternalName?: string | null
  cooldown?: number | null
  duration?: number | null
  droppable?: boolean | null
  categories: string[]
  icon: string
}

export const RARITY_ORDER = [
  "Common",
  "Uncommon",
  "Legendary",
  "Boss",
  "Lunar",
  "Void",
  // Equipment categories (wiki uses these as "rarity" labels in the Lua module)
  "Equipment",
  "Lunar Equipment",
  "Elite Equipment",
] as const

export function normalizeText(input: string) {
  return input.trim().toLowerCase()
}

export function stripWikiMarkup(input: string) {
  // Best-effort cleanup for wiki Lua strings like {{Color|d|...}} and {{Stack|...}}
  return input
    .replace(/\{\{Color\|[^|}]*\|([^}]*)\}\}/g, "$1")
    .replace(/\{\{Stack\|([^}]*)\}\}/g, "$1")
    .replace(/\{\{[^}]*\}\}/g, "")
    .replace(/\[\[|\]\]/g, "")
    .replace(/'''/g, "")
    .replace(/\s+/g, " ")
    .trim()
}

export function uniq<T>(arr: T[]) {
  return Array.from(new Set(arr))
}

export function isProbablyDesktop() {
  // Used only to decide if we enable hover UI and drag affordances.
  // We still let the browser decide drag/drop behavior.
  if (typeof window === "undefined") return false
  return window.matchMedia("(hover: hover) and (pointer: fine)").matches
}

export function rarityStyle(rarity: string): { ring: string; glow: string; text: string } {
  switch (rarity) {
    case "Common":
      return {
        ring: "ring-zinc-400/70",
        glow: "shadow-[0_0_16px_rgba(161,161,170,0.28)]",
        text: "text-zinc-600",
      }
    case "Uncommon":
      return {
        ring: "ring-emerald-500/70",
        glow: "shadow-[0_0_18px_rgba(16,185,129,0.30)]",
        text: "text-emerald-600",
      }
    case "Legendary":
      return {
        ring: "ring-rose-500/70",
        glow: "shadow-[0_0_18px_rgba(244,63,94,0.30)]",
        text: "text-rose-600",
      }
    case "Boss":
      return {
        ring: "ring-amber-500/70",
        glow: "shadow-[0_0_18px_rgba(245,158,11,0.30)]",
        text: "text-amber-600",
      }
    case "Lunar":
      return {
        ring: "ring-sky-500/70",
        glow: "shadow-[0_0_18px_rgba(14,165,233,0.30)]",
        text: "text-sky-600",
      }
    case "Void":
      return {
        ring: "ring-violet-500/70",
        glow: "shadow-[0_0_18px_rgba(139,92,246,0.30)]",
        text: "text-violet-600",
      }
    case "Equipment":
      return {
        ring: "ring-orange-500/70",
        glow: "shadow-[0_0_18px_rgba(249,115,22,0.30)]",
        text: "text-orange-600",
      }
    case "Lunar Equipment":
      return {
        ring: "ring-sky-500/70",
        glow: "shadow-[0_0_18px_rgba(14,165,233,0.30)]",
        text: "text-sky-600",
      }
    case "Elite Equipment":
      return {
        ring: "ring-fuchsia-500/70",
        glow: "shadow-[0_0_18px_rgba(217,70,239,0.30)]",
        text: "text-fuchsia-600",
      }
    default:
      return {
        ring: "ring-zinc-400/70",
        glow: "shadow-[0_0_16px_rgba(161,161,170,0.25)]",
        text: "text-zinc-600",
      }
  }
}

export function normalizeItems(raw: Ror2ItemRaw[]): UiItem[] {
  return (Array.isArray(raw) ? raw : [])
    .map((r, idx) => {
      const description = r.description ? stripWikiMarkup(r.description) : ""
      return { r, idx, description }
    })
    .filter(({ description }) => description.trim().length > 0)
    .map(({ r, idx, description }) => {
    const internalName = r.internalName ?? null
    const localizationInternalName = r.localizationInternalName ?? null
    const type: UiItem["type"] = r.type === "equipment" ? "equipment" : "item"
    const name = (r.name ?? "").trim() || "(Unknown item)"
    const baseId =
      (typeof internalName === "string" && internalName.trim()) ||
      (typeof localizationInternalName === "string" && localizationInternalName.trim()) ||
      name ||
      `item_${idx}`
    // Keep existing item ids stable; only prefix equipments to avoid collisions.
    const id = type === "equipment" ? `eq:${baseId}` : baseId
    return {
      id,
      type,
      name,
      rarity: (r.rarity ?? "Unknown").trim() || "Unknown",
      description,
      internalName,
      localizationInternalName,
      cooldown: typeof r.cooldown === "number" ? r.cooldown : null,
      duration: typeof r.duration === "number" ? r.duration : null,
      droppable: typeof r.droppable === "boolean" ? r.droppable : null,
      categories: Array.isArray(r.categories) ? r.categories.filter(Boolean) : [],
      icon: r.icon ?? "/file.svg",
    }
    })
}

export function clampToThreeLines(text: string) {
  // UI clamp is done with CSS line-clamp; keep function in case we want fallback later.
  return text
}


