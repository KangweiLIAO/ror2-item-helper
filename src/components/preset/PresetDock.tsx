"use client"

import * as React from "react"
import { XIcon } from "lucide-react"

import type { UiItem } from "@/lib/ror2-items"
import { isProbablyDesktop, rarityStyle } from "@/lib/ror2-items"
import { Button } from "@/components/ui/button"
import { useI18n } from "@/i18n/LocaleProvider"
import { cn } from "@/lib/utils"

export function PresetDock({
  itemsById,
  currentIds,
  onClear,
  onSave,
  onRemoveOne,
  onDropAdd,
  onCanAcceptDrop,
  rightSlot,
}: {
  itemsById: Map<string, UiItem>
  currentIds: string[]
  onClear: () => void
  onSave: () => void
  onRemoveOne: (id: string) => void
  onDropAdd: (e: React.DragEvent) => void
  onCanAcceptDrop: (e: React.DragEvent) => boolean
  rightSlot?: React.ReactNode
}) {
  const desktop = React.useMemo(() => isProbablyDesktop(), [])
  const { t } = useI18n()

  return (
    <div className="fixed inset-x-0 bottom-0 z-40 border-t bg-background/92 backdrop-blur">
      <div className="mx-auto w-full max-w-[1100px] px-3 py-2 sm:px-4">
        {desktop ? <div className="mb-1 text-xs font-medium text-muted-foreground">{t("dock.dropHint")}</div> : null}
        <div className="flex items-stretch gap-2">
          <div className="min-w-0 flex-1">
            <div
              className={cn("rounded-md border bg-background px-2 py-2", "min-h-12")}
              onDragOver={(e) => {
                if (!desktop) return
                if (!onCanAcceptDrop(e)) return
                e.preventDefault()
              }}
              onDrop={(e) => {
                if (!desktop) return
                onDropAdd(e)
              }}
            >
              <div className="grid grid-cols-[minmax(0,1fr)_auto] items-center gap-2">
                <div className="min-w-0">
                  {currentIds.length === 0 ? (
                    <div className="text-xs text-muted-foreground">{t("dock.empty")}</div>
                  ) : (
                    <div className="flex items-center gap-2 overflow-x-auto pb-1">
                      {currentIds.map((id) => {
                        const it = itemsById.get(id)
                        if (!it) return null
                        const style = rarityStyle(it.rarity)
                        return (
                          <div
                            key={id}
                            className={cn(
                              "relative size-10 shrink-0 rounded-lg bg-zinc-950/5 dark:bg-white/5 ring-2 ring-inset",
                              style.ring,
                              style.glow
                            )}
                            title={it.name}
                          >
                            <img src={it.icon} alt={it.name} className="h-full w-full object-contain p-1" />
                            <button
                              type="button"
                              className="absolute -top-1 -right-1 grid size-5 place-items-center rounded-full bg-background/90 text-foreground shadow"
                              onClick={() => onRemoveOne(id)}
                            >
                              <XIcon className="size-3" />
                            </button>
                          </div>
                        )
                      })}
                    </div>
                  )}
                </div>
                <div className="flex items-center gap-2">
                  <Button size="sm" variant="outline" onClick={onClear} disabled={currentIds.length === 0}>
                    {t("dock.clear")}
                  </Button>
                  <Button size="sm" onClick={onSave} disabled={currentIds.length === 0}>
                    {t("dock.save")}
                  </Button>
                </div>
              </div>
            </div>
          </div>
          {rightSlot ? <div className="shrink-0">{rightSlot}</div> : null}
        </div>
      </div>
    </div>
  )
}


