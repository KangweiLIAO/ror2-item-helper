"use client"

import * as React from "react"

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
import { RARITY_ORDER, isProbablyDesktop, normalizeText, uniq } from "@/lib/ror2-items"
import { LocaleProvider, useI18n } from "@/i18n/LocaleProvider"

function HomeInner() {
  const { t, locale } = useI18n()
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

  function onDragStartItem(e: React.DragEvent, itemId: string) {
    e.dataTransfer.setData("application/x-ror2-item", itemId)
    e.dataTransfer.effectAllowed = "copy"
  }

  function readDraggedItemId(e: React.DragEvent) {
    const id = e.dataTransfer.getData("application/x-ror2-item")
    return id || null
  }

  function canAcceptDrop(e: React.DragEvent) {
    return Array.from(e.dataTransfer.types).includes("application/x-ror2-item")
  }

  function loadPresetIntoCurrent(presetId: string) {
    const p = presets.find((x) => x.id === presetId)
    if (!p) return
    setCurrentItemIds(new Set(p.itemIds))
  }

  const detailsItem = detailsItemId ? (itemsById.get(detailsItemId) ?? null) : null
  const detailsSelected = detailsItem ? currentItemIds.has(detailsItem.id) : false

  return (
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
      <div className="mx-auto w-full max-w-[1100px] px-3 pb-28 pt-4 sm:px-4">
        {itemsError ? (
          <div className="rounded-md border bg-destructive/10 p-4 text-sm text-destructive">
            {itemsError}
          </div>
        ) : loading ? (
          <div className="rounded-md border p-4 text-sm text-muted-foreground">{t("app.loadingItems")}</div>
        ) : (
          <ItemsGrid
            items={filtered}
            selectedIds={currentItemIds}
            onToggleSelected={toggleCurrent}
            onOpenDetails={openDetails}
            onDragStartItem={onDragStartItem}
          />
        )}
      </div>

      {/* Preset dock (always visible) */}
      <PresetDock
        itemsById={itemsById}
        currentIds={currentIds}
        onClear={clearCurrent}
        onSave={() => setSaveDialogOpen(true)}
        onRemoveOne={removeFromCurrent}
        onCanAcceptDrop={canAcceptDrop}
        onDropAdd={(e) => {
          const id = readDraggedItemId(e)
          if (!id) return
          e.preventDefault()
          addToCurrent(id)
        }}
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
            onAddItemToPreset={addItemToPreset}
            onRemoveItemFromPreset={removeItemFromPreset}
            onDragStartItem={onDragStartItem}
            canAcceptDrop={canAcceptDrop}
            readDraggedItemId={readDraggedItemId}
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
    </div>
  )
}

export default function Home() {
  return (
    <LocaleProvider>
      <HomeInner />
    </LocaleProvider>
  )
}
