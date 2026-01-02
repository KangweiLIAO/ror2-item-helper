export type Preset = {
  id: string
  name: string
  itemIds: string[] // UiItem.id
  createdAt: number
}

export const PRESETS_STORAGE_KEY = "ror2-items-presets-v1"

export function createId() {
  if (typeof crypto !== "undefined" && "randomUUID" in crypto) {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return (crypto as any).randomUUID() as string
  }
  return `preset_${Date.now()}_${Math.random().toString(16).slice(2)}`
}

export function loadPresets(): Preset[] {
  if (typeof window === "undefined") return []
  try {
    const raw = window.localStorage.getItem(PRESETS_STORAGE_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw) as unknown
    if (!Array.isArray(parsed)) return []
    return parsed
      .map((p) => {
        const maybe = p as Partial<Preset>
        if (!maybe.id || !maybe.name || !Array.isArray(maybe.itemIds)) return null
        return {
          id: maybe.id,
          name: maybe.name,
          itemIds: maybe.itemIds,
          createdAt: typeof maybe.createdAt === "number" ? maybe.createdAt : Date.now(),
        } satisfies Preset
      })
      .filter(Boolean) as Preset[]
  } catch {
    return []
  }
}

export function savePresets(presets: Preset[]) {
  if (typeof window === "undefined") return
  window.localStorage.setItem(PRESETS_STORAGE_KEY, JSON.stringify(presets))
}

export function nextDefaultPresetName(existing: Preset[], prefix = "Preset") {
  const used = new Set(existing.map((p) => p.name))
  for (let i = 1; i < 9999; i++) {
    const candidate = `${prefix} ${i}`
    if (!used.has(candidate)) return candidate
  }
  return `${prefix} ${existing.length + 1}`
}


