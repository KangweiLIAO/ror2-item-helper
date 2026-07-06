"use client"

import * as React from "react"
import { XIcon } from "lucide-react"
import { useDroppable } from "@dnd-kit/core"
import { SortableContext, horizontalListSortingStrategy, useSortable } from "@dnd-kit/sortable"
import { CSS } from "@dnd-kit/utilities"

import type { UiItem } from "@/lib/ror2-items"
import { isProbablyDesktop, rarityStyle } from "@/lib/ror2-items"
import { Button } from "@/components/ui/button"
import { useI18n } from "@/i18n/LocaleProvider"
import { cn } from "@/lib/utils"

function SortableDockItem({
  id,
  item,
  desktop,
  onRemove,
}: {
  id: string
  item: UiItem
  desktop: boolean
  onRemove: () => void
}) {
  const style = rarityStyle(item.rarity)
  const { attributes, listeners, setNodeRef, transform, transition, isDragging } = useSortable({
    id: `dockitem:${id}`,
    disabled: !desktop,
  })

  return (
    <div
      ref={setNodeRef}
      style={{ transform: CSS.Transform.toString(transform), transition }}
      className={cn(
        "relative size-10 shrink-0 rounded-lg bg-zinc-950/5 dark:bg-white/5 ring-2 ring-inset",
        style.ring,
        style.glow,
        desktop && "cursor-grab",
        isDragging && "cursor-grabbing opacity-40 z-10"
      )}
      title={item.name}
      {...attributes}
      {...listeners}
    >
      <img src={item.icon} alt={item.name} className="h-full w-full object-contain p-1" draggable={false} />
      <button
        type="button"
        className="absolute -top-1 -right-1 grid size-5 place-items-center rounded-full bg-background/90 text-foreground shadow"
        onPointerDown={(e) => e.stopPropagation()}
        onClick={onRemove}
      >
        <XIcon className="size-3" />
      </button>
    </div>
  )
}

export function PresetDock({
  itemsById,
  currentIds,
  onClear,
  onSave,
  onRemoveOne,
  activeItemId,
  rightSlot,
}: {
  itemsById: Map<string, UiItem>
  currentIds: string[]
  onClear: () => void
  onSave: () => void
  onRemoveOne: (id: string) => void
  activeItemId: string | null
  rightSlot?: React.ReactNode
}) {
  const desktop = React.useMemo(() => isProbablyDesktop(), [])
  const { t } = useI18n()
  const { isOver, setNodeRef } = useDroppable({
    id: "dock",
    disabled: !desktop,
  })
  const showPlaceholder = !!activeItemId && isOver && !currentIds.includes(activeItemId)

  return (
    <div className="fixed inset-x-0 lg:py-3 bottom-0 z-40 border-t bg-background/92 backdrop-blur">
      <div className="mx-auto w-full max-w-[1100px] px-3 py-2 sm:px-4">
        <div className="flex items-stretch gap-2">
          <div className="min-w-0 flex-1">
            <div
              ref={setNodeRef}
              className={cn(
                "rounded-md border bg-background px-2 py-2",
                "min-h-12",
                showPlaceholder && "border-dashed border-primary/60 bg-primary/5"
              )}
            >
              <div className="grid grid-cols-[minmax(0,1fr)_auto] items-center gap-2">
                <div className="min-w-0">
                  {currentIds.length === 0 ? (
                    <div className="flex items-center gap-2">
                      <div className="text-xs text-muted-foreground">{t("dock.empty")}</div>
                      {showPlaceholder ? (
                        <div className="size-10 shrink-0 rounded-lg border-2 border-dashed border-primary/60 bg-background/60" />
                      ) : null}
                    </div>
                  ) : (
                    <div className="flex items-center gap-2 overflow-x-auto pb-1">
                      <SortableContext
                        items={currentIds.map((id) => `dockitem:${id}`)}
                        strategy={horizontalListSortingStrategy}
                      >
                        {currentIds.map((id) => {
                          const it = itemsById.get(id)
                          if (!it) return null
                          return (
                            <SortableDockItem
                              key={id}
                              id={id}
                              item={it}
                              desktop={desktop}
                              onRemove={() => onRemoveOne(id)}
                            />
                          )
                        })}
                      </SortableContext>
                      {showPlaceholder ? (
                        <div className="size-10 shrink-0 rounded-lg border-2 border-dashed border-primary/60 bg-background/60" />
                      ) : null}
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


