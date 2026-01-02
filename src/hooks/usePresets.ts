"use client"

import * as React from "react"

import type { Preset } from "@/lib/presets"
import { createId, loadPresets, nextDefaultPresetName, savePresets } from "@/lib/presets"

export function usePresets() {
  const [presets, setPresets] = React.useState<Preset[]>([])

  React.useEffect(() => {
    setPresets(loadPresets())
  }, [])

  React.useEffect(() => {
    savePresets(presets)
  }, [presets])

  const addItemToPreset = React.useCallback((presetId: string, itemId: string) => {
    setPresets((prev) =>
      prev.map((p) => {
        if (p.id !== presetId) return p
        if (p.itemIds.includes(itemId)) return p
        return { ...p, itemIds: [...p.itemIds, itemId] }
      })
    )
  }, [])

  const removeItemFromPreset = React.useCallback((presetId: string, itemId: string) => {
    setPresets((prev) =>
      prev.map((p) => {
        if (p.id !== presetId) return p
        return { ...p, itemIds: p.itemIds.filter((id) => id !== itemId) }
      })
    )
  }, [])

  const renamePreset = React.useCallback((presetId: string, name: string) => {
    setPresets((prev) => prev.map((p) => (p.id === presetId ? { ...p, name } : p)))
  }, [])

  const deletePreset = React.useCallback((presetId: string) => {
    setPresets((prev) => prev.filter((p) => p.id !== presetId))
  }, [])

  const createPreset = React.useCallback((name: string, itemIds: string[]) => {
    setPresets((prev) => {
      const next: Preset = {
        id: createId(),
        name: name.trim() || nextDefaultPresetName(prev),
        itemIds,
        createdAt: Date.now(),
      }
      return [next, ...prev]
    })
  }, [])

  return {
    presets,
    setPresets,
    createPreset,
    renamePreset,
    deletePreset,
    addItemToPreset,
    removeItemFromPreset,
  }
}


