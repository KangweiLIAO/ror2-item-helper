export type SearchParamsLike = {
  get(name: string): string | null
  entries(): IterableIterator<[string, string]>
}

function isReservedQueryKey(key: string) {
  // App-owned query keys that should never be interpreted as share IDs.
  // (Future keys can be added here as needed.)
  return key === "lang"
}

/**
 * Share format:
 * - ?share=<id1>&<id2>&<id3>...
 *
 * Notes:
 * - <id2> is parsed as a query key with an empty value
 *   by URLSearchParams (i.e. "id2" -> "").
 * - We only interpret such empty-valued keys as IDs when a "share" param exists,
 *   to avoid accidentally consuming unrelated boolean-ish params.
 */
export function getShareIds(searchParams: SearchParamsLike): string[] {
  const first = (searchParams.get("share") ?? "").trim()
  const hasShareParam = first.length > 0
  if (!hasShareParam) return []

  const out: string[] = [first]
  for (const [key, value] of searchParams.entries()) {
    if (key === "share") continue
    if (value !== "") continue
    if (isReservedQueryKey(key)) continue
    const id = key.trim()
    if (!id) continue
    out.push(id)
  }

  // Dedupe while preserving order (protects against accidental duplicates).
  const seen = new Set<string>()
  return out.filter((id) => (seen.has(id) ? false : (seen.add(id), true)))
}

export function stripShareFromSearchParams(current: URLSearchParams): URLSearchParams {
  const original = new URLSearchParams(current)
  const hasShareParam = (original.get("share") ?? "").trim().length > 0

  const toDelete: string[] = ["share"]
  if (hasShareParam) {
    for (const [key, value] of original.entries()) {
      if (key === "share") continue
      if (value !== "") continue
      if (isReservedQueryKey(key)) continue
      const id = key.trim()
      if (!id) continue
      toDelete.push(key)
    }
  }

  const sp = new URLSearchParams(original)
  for (const key of toDelete) sp.delete(key)
  return sp
}

export function buildShareSearch(itemIds: string[]): string {
  const ids = itemIds.map((s) => s.trim()).filter(Boolean)
  if (ids.length === 0) return ""

  const [first, ...rest] = ids
  const parts = [`share=${encodeURIComponent(first)}`, ...rest.map((id) => encodeURIComponent(id))]
  return `?${parts.join("&")}`
}


