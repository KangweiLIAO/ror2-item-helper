"use client"

import * as React from "react"
import { usePathname, useRouter, useSearchParams } from "next/navigation"
import { DndContext, DragOverlay, PointerSensor, useSensor, useSensors, type DragEndEvent, type DragStartEvent } from "@dnd-kit/core"

import { Button } from "@/components/ui/button"
import { ItemDetailsDialog, ItemDetailsSheet } from "@/components/items/ItemDetails"
import { ItemsFiltersBar } from "@/components/items/ItemsFiltersBar"
import { ItemsGrid } from "@/components/items/ItemsGrid"
import { PresetDock } from "@/components/preset/PresetDock"
import { PresetsSheet } from "@/components/preset/PresetsSheet"
import { SavePresetDialog } from "@/components/preset/SavePresetDialog"
import { useItemsData } from "@/hooks/useItemsData"
import { usePresets } from "@/hooks/usePresets"
import { nextDefaultPresetName } from "@/lib/presets"
import { RARITY_ORDER, isProbablyDesktop, normalizeText, rarityStyle, uniq } from "@/lib/ror2-items"
import { LocaleProvider, useI18n } from "@/i18n/LocaleProvider"
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle } from "@/components/ui/dialog"
import { cn } from "@/lib/utils"

function HomeInner() {
  const { t, locale } = useI18n()
  const searchParams = useSearchParams()
  const router = useRouter()
  const pathname = usePathname()
  const { items, error: itemsError, loading } = useItemsData(locale)
  const [query, setQuery] = React.useState("")
  const [rarities, setRarities] = React.useState<Set<string>>(new Set())

  const [currentItemIds, setCurrentItemIds] = React.useState<Set<string>>(new Set())
  const { presets, createPreset, renamePreset, deletePreset, addItemToPreset, removeItemFromPreset } = usePresets()

  const [detailsOpen, setDetailsOpen] = React.useState(false)
  const [detailsItemId, setDetailsItemId] = React.useState<string | null>(null)

  const [saveDialogOpen, setSaveDialogOpen] = React.useState(false)
  const [saveName, setSaveName] = React.useState("")

  const desktop = React.useMemo(() => isProbablyDesktop(), [])
  const [activeItemId, setActiveItemId] = React.useState<string | null>(null)

  const sensors = useSensors(
    useSensor(PointerSensor, {
      activationConstraint: { distance: 6 },
    })
  )

  React.useEffect(() => {
    if (!saveDialogOpen) return
    setSaveName(nextDefaultPresetName(presets, t("presets.defaultPrefix")))
  }, [saveDialogOpen, presets, t])

  const allRarities = React.useMemo(() => {
    const fromData = uniq(items.map((i) => i.rarity).filter(Boolean)).sort()
    const ordered = [
      ...RARITY_ORDER.filter((r) => fromData.includes(r)),
      ...fromData.filter((r) => !RARITY_ORDER.includes(r as never)),
    ]
    return ordered
  }, [items])

  const filtered = React.useMemo(() => {
    const q = normalizeText(query)
    const list = items.filter((it) => {
      if (rarities.size > 0 && !rarities.has(it.rarity)) return false
      if (!q) return true
      const hay = `${it.name} ${it.description}`.toLowerCase()
      return hay.includes(q)
    })

    const rarityRank = new Map<string, number>(RARITY_ORDER.map((r, idx) => [r, idx]))
    list.sort((a, b) => {
      const ra = rarityRank.get(a.rarity) ?? 999
      const rb = rarityRank.get(b.rarity) ?? 999
      if (ra !== rb) return ra - rb
      return a.name.localeCompare(b.name)
    })

    return list
  }, [items, rarities, query])

  const itemsById = React.useMemo(() => {
    const map = new Map<string, (typeof items)[number]>()
    for (const it of items) map.set(it.id, it)
    return map
  }, [items])

  const currentIds = React.useMemo(() => Array.from(currentItemIds), [currentItemIds])

  const openDetails = React.useCallback((id: string) => {
    setDetailsItemId(id)
    setDetailsOpen(true)
  }, [])

  const toggleCurrent = React.useCallback((id: string) => {
    setCurrentItemIds((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }, [])

  const addToCurrent = React.useCallback((id: string) => {
    setCurrentItemIds((prev) => new Set(prev).add(id))
  }, [])

  const removeFromCurrent = React.useCallback((id: string) => {
    setCurrentItemIds((prev) => {
      const next = new Set(prev)
      next.delete(id)
      return next
    })
  }, [])

  const clearCurrent = React.useCallback(() => {
    setCurrentItemIds(new Set())
  }, [])

  function onDragStart(e: DragStartEvent) {
    const id = String(e.active.id)
    if (!id.startsWith("item:")) return
    setActiveItemId(id.slice("item:".length))
  }

  function onDragEnd(e: DragEndEvent) {
    const active = String(e.active.id)
    const over = e.over ? String(e.over.id) : null
    const itemId = active.startsWith("item:") ? active.slice("item:".length) : null
    setActiveItemId(null)
    if (!desktop) return
    if (!itemId || !over) return
    if (over === "dock") {
      addToCurrent(itemId)
      return
    }
    if (over.startsWith("preset:")) {
      const presetId = over.slice("preset:".length)
      addItemToPreset(presetId, itemId)
    }
  }

  function loadPresetIntoCurrent(presetId: string) {
    const p = presets.find((x) => x.id === presetId)
    if (!p) return
    setCurrentItemIds(new Set(p.itemIds))
  }

  const detailsItem = detailsItemId ? (itemsById.get(detailsItemId) ?? null) : null
  const detailsSelected = detailsItem ? currentItemIds.has(detailsItem.id) : false

  const shareIds = React.useMemo(() => {
    const raw = searchParams.getAll("share")
    return raw.map((s) => s.trim()).filter(Boolean)
  }, [searchParams])

  const shareKey = React.useMemo(() => (shareIds.length ? shareIds.join("\u0001") : ""), [shareIds])
  const [sharedOpen, setSharedOpen] = React.useState(false)
  const [sharedLastKey, setSharedLastKey] = React.useState("")

  React.useEffect(() => {
    if (!shareKey) return
    if (shareKey === sharedLastKey) return
    setSharedLastKey(shareKey)
    setSharedOpen(true)
  }, [shareKey, sharedLastKey])

  const sharedKnownIds = React.useMemo(() => shareIds.filter((id) => itemsById.has(id)), [shareIds, itemsById])
  const sharedUnknownCount = React.useMemo(() => shareIds.length - sharedKnownIds.length, [shareIds.length, sharedKnownIds.length])

  function removeShareFromUrl() {
    const sp = new URLSearchParams(searchParams)
    sp.delete("share")
    const qs = sp.toString()
    router.replace(`${pathname}${qs ? `?${qs}` : ""}`)
  }

  return (
    <DndContext sensors={sensors} onDragStart={onDragStart} onDragEnd={onDragEnd} onDragCancel={() => setActiveItemId(null)}>
      <div className="min-h-screen bg-background text-foreground">
        <ItemsFiltersBar
          query={query}
          onQueryChange={setQuery}
          rarities={rarities}
          allRarities={allRarities}
          onToggleRarity={(rarity, checked) => {
            const next = new Set(rarities)
            if (checked) next.add(rarity)
            else next.delete(rarity)
            setRarities(next)
          }}
          onReset={() => {
            setRarities(new Set())
            setQuery("")
          }}
          showingCount={filtered.length}
          totalCount={items.length}
          currentSelectedCount={currentItemIds.size}
        />

        {/* Main grid */}
        <div className="mx-auto w-full max-w-[1200px] px-3 pb-28 pt-4 sm:px-4">
          {itemsError ? (
            <div className="rounded-md border bg-destructive/10 p-4 text-sm text-destructive">{itemsError}</div>
          ) : loading ? (
            <div className="rounded-md border p-4 text-sm text-muted-foreground">{t("app.loadingItems")}</div>
          ) : (
            <ItemsGrid
              items={filtered}
              selectedIds={currentItemIds}
              onToggleSelected={toggleCurrent}
              onOpenDetails={openDetails}
            />
          )}
        </div>

        {/* Preset dock (always visible) */}
        <PresetDock
          itemsById={itemsById}
          currentIds={currentIds}
          activeItemId={activeItemId}
          onClear={clearCurrent}
          onSave={() => setSaveDialogOpen(true)}
          onRemoveOne={removeFromCurrent}
          rightSlot={
            <PresetsSheet
              trigger={
                <Button variant="outline" className="h-full">
                  {t("app.presets")}
                </Button>
              }
              presets={presets}
              itemsById={itemsById}
              onLoadPresetIntoCurrent={loadPresetIntoCurrent}
              onRenamePreset={renamePreset}
              onDeletePreset={deletePreset}
              onRemoveItemFromPreset={removeItemFromPreset}
            />
          }
        />

        <ItemDetailsDialog
          open={detailsOpen && desktop}
          onOpenChange={setDetailsOpen}
          item={detailsItem}
          selected={detailsSelected}
          onToggleSelected={() => {
            if (!detailsItem) return
            toggleCurrent(detailsItem.id)
          }}
        />
        <ItemDetailsSheet
          open={detailsOpen && !desktop}
          onOpenChange={setDetailsOpen}
          item={detailsItem}
          selected={detailsSelected}
          onToggleSelected={() => {
            if (!detailsItem) return
            toggleCurrent(detailsItem.id)
          }}
        />
        <SavePresetDialog
          open={saveDialogOpen}
          onOpenChange={setSaveDialogOpen}
          name={saveName}
          onNameChange={setSaveName}
          selectedCount={currentItemIds.size}
          onSave={() => {
            createPreset(saveName, Array.from(currentItemIds))
            setSaveDialogOpen(false)
          }}
        />

        {/* Shared preset preview (import-only; does not touch current selection) */}
        <Dialog open={sharedOpen && shareIds.length > 0} onOpenChange={setSharedOpen}>
          <DialogContent className="max-w-xl">
            <DialogHeader>
              <DialogTitle>{t("shared.title")}</DialogTitle>
              <DialogDescription>{t("shared.desc")}</DialogDescription>
            </DialogHeader>

            <div className="space-y-3">
              <div className="text-sm text-muted-foreground">
                {t("shared.itemsMeta", { known: sharedKnownIds.length, unknown: sharedUnknownCount })}
              </div>

              {sharedKnownIds.length === 0 ? (
                <div className="rounded-md border p-4 text-sm text-muted-foreground">
                  {loading ? t("app.loadingItems") : t("shared.noValidItems")}
                </div>
              ) : (
                <div className="rounded-lg border p-4">
                  <div className="flex flex-wrap gap-2">
                    {sharedKnownIds.slice(0, 28).map((id) => {
                      const it = itemsById.get(id)
                      if (!it) return null
                      const style = rarityStyle(it.rarity)
                      return (
                        <div
                          key={id}
                          className={cn(
                            "relative size-12 overflow-hidden rounded-xl bg-zinc-950/5 dark:bg-white/5 ring-2 ring-inset",
                            style.ring,
                            style.glow
                          )}
                          title={it.name}
                        >
                          <img src={it.icon} alt={it.name} className="h-full w-full object-contain p-1.5" draggable={false} />
                        </div>
                      )
                    })}
                    {sharedKnownIds.length > 28 ? (
                      <div className="grid size-12 place-items-center rounded-xl border bg-muted/40 text-xs text-muted-foreground">
                        +{sharedKnownIds.length - 28}
                      </div>
                    ) : null}
                  </div>
                </div>
              )}
            </div>

            <DialogFooter>
              <Button variant="default" onClick={() => setSharedOpen(false)}>
                {t("shared.close")}
              </Button>
              <Button
                onClick={() => {
                  const name = nextDefaultPresetName(presets, t("presets.defaultPrefix"))
                  createPreset(name, sharedKnownIds)
                  setSharedOpen(false)
                  removeShareFromUrl()
                }}
                disabled={sharedKnownIds.length === 0}
              >
                {t("shared.saveToMyPresets")}
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>
      </div>

      <DragOverlay dropAnimation={null}>
        {activeItemId ? (() => {
          const it = itemsById.get(activeItemId)
          if (!it) return null
          const style = rarityStyle(it.rarity)
          return (
            <div
              className={cn(
                "relative size-14 overflow-hidden rounded-xl bg-background/90 shadow-lg ring-2 ring-inset",
                style.ring,
                style.glow
              )}
            >
              <img src={it.icon} alt={it.name} className="h-full w-full object-contain p-2" draggable={false} />
            </div>
          )
        })() : null}
      </DragOverlay>
    </DndContext>
  )
}

export default function HomeClient() {
  return (
    <LocaleProvider>
      <HomeInner />
    </LocaleProvider>
  )
}
