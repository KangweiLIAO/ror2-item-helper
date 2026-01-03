"use client"

import * as React from "react"
import { XIcon } from "lucide-react"
import { toast } from "sonner"
import { useDraggable, useDroppable } from "@dnd-kit/core"

import type { Preset } from "@/lib/presets"
import type { UiItem } from "@/lib/ror2-items"
import { isProbablyDesktop, rarityStyle } from "@/lib/ror2-items"
import { Button } from "@/components/ui/button"
import {
  Sheet,
  SheetContent,
  SheetTrigger,
  SheetTitle,
  SheetHeader,
} from "@/components/ui/sheet"
import { cn } from "@/lib/utils"
import { useI18n } from "@/i18n/LocaleProvider"

// VisuallyHidden component for accessibility (Radix pattern)
const VisuallyHidden = ({ children }: { children: React.ReactNode }) => (
  <span style={{
    position: "absolute",
    width: "1px",
    height: "1px",
    padding: 0,
    margin: "-1px",
    overflow: "hidden",
    clip: "rect(0, 0, 0, 0)",
    whiteSpace: "nowrap",
    border: 0
  }}>{children}</span>
);

function DraggablePresetItem({
  item,
  desktop,
  onRemove,
}: {
  item: UiItem
  desktop: boolean
  onRemove: () => void
}) {
  const style = rarityStyle(item.rarity)
  const { attributes, listeners, setNodeRef, isDragging } = useDraggable({
    id: `item:${item.id}`,
    disabled: !desktop,
  })

  return (
    <div
      ref={setNodeRef}
      className={cn(
        "group relative size-12 rounded-xl bg-zinc-950/5 dark:bg-white/5 ring-2 ring-inset transition-transform duration-150 ease-out",
        style.ring,
        style.glow,
        desktop && "cursor-grab",
        desktop && "hover:scale-[1.06]",
        // We use DragOverlay for the moving preview; keep the original tile in place.
        isDragging && "cursor-grabbing opacity-20 scale-[1.03]"
      )}
      title={item.name}
      {...attributes}
      {...listeners}
    >
      <img
        src={item.icon}
        alt={item.name}
        className={cn(
          "h-full w-full object-contain p-1.5",
          "transition-transform duration-150 ease-out"
        )}
        draggable={false}
      />
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

function PresetCard({
  preset,
  desktop,
  itemsById,
  locale,
  t,
  onLoadPresetIntoCurrent,
  onRenamePreset,
  onDeletePreset,
  onRemoveItemFromPreset,
}: {
  preset: Preset
  desktop: boolean
  itemsById: Map<string, UiItem>
  locale: string
  t: (key: string, vars?: Record<string, unknown>) => string
  onLoadPresetIntoCurrent: (presetId: string) => void
  onRenamePreset: (presetId: string, name: string) => void
  onDeletePreset: (presetId: string) => void
  onRemoveItemFromPreset: (presetId: string, itemId: string) => void
}) {
  const { isOver, setNodeRef } = useDroppable({
    id: `preset:${preset.id}`,
    disabled: !desktop,
  })

  return (
    <div
      ref={setNodeRef}
      className={cn(
        "rounded-lg border p-4",
        isOver && "border-dashed border-primary/60 bg-primary/5"
      )}
    >
      <div className="flex flex-col gap-3">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div className="flex-1">
            <input
              value={preset.name}
              onChange={(e) => onRenamePreset(preset.id, e.target.value)}
              className="h-9 w-full rounded-md border bg-background px-3 text-sm font-medium outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
            />
            <div className="mt-1 text-xs text-muted-foreground">
              {t("presets.meta", {
                count: preset.itemIds.length,
                date: new Date(preset.createdAt).toLocaleString(
                  locale === "zh-CN" ? "zh-CN" : "en",
                  {
                    year: "numeric",
                    month: "numeric",
                    day: "numeric",
                    hour: "2-digit",
                    minute: "2-digit",
                    second: "2-digit",
                  }
                ),
              })}
            </div>
          </div>
          <div className="flex items-center gap-2">
            <Button
              variant="default"
              onClick={() => onLoadPresetIntoCurrent(preset.id)}
            >
              {t("presets.load")}
            </Button>
            <Button
              variant="outline"
              onClick={async () => {
                try {
                  const url = buildShareUrl(preset.itemIds)
                  await copyToClipboard(url)
                  toast.success(t("share.copied"))
                } catch {
                  toast.error(t("share.copyFailed"))
                }
              }}
            >
              {t("share.share")}
            </Button>
            <Button variant="destructive" onClick={() => onDeletePreset(preset.id)}>
              {t("presets.delete")}
            </Button>
          </div>
        </div>

        {preset.itemIds.length === 0 ? (
          <div className="text-sm text-muted-foreground">
            {t("presets.itemsEmpty")}
          </div>
        ) : (
          <div className="flex flex-wrap gap-2">
            {preset.itemIds.map((id) => {
              const it = itemsById.get(id)
              if (!it) return null
              return (
                <DraggablePresetItem
                  key={id}
                  item={it}
                  desktop={desktop}
                  onRemove={() => onRemoveItemFromPreset(preset.id, id)}
                />
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}

function buildShareUrl(itemIds: string[]) {
  const origin = typeof window !== "undefined" ? window.location.origin : ""
  const pathname = typeof window !== "undefined" ? window.location.pathname : "/"
  const sp = new URLSearchParams()
  for (const id of itemIds) sp.append("share", id)
  const qs = sp.toString()
  return `${origin}${pathname}${qs ? `?${qs}` : ""}`
}

async function copyToClipboard(text: string) {
  if (typeof navigator !== "undefined" && navigator.clipboard?.writeText) {
    await navigator.clipboard.writeText(text)
    return
  }
  // Fallback: open a prompt so the user can copy manually.
  // (This avoids introducing a full toast/provider system just for this action.)
  window.prompt("Copy URL", text)
}

export function PresetsSheet({
  trigger,
  presets,
  itemsById,
  onLoadPresetIntoCurrent,
  onRenamePreset,
  onDeletePreset,
  onRemoveItemFromPreset,
}: {
  trigger: React.ReactNode
  presets: Preset[]
  itemsById: Map<string, UiItem>
  onLoadPresetIntoCurrent: (presetId: string) => void
  onRenamePreset: (presetId: string, name: string) => void
  onDeletePreset: (presetId: string) => void
  onRemoveItemFromPreset: (presetId: string, itemId: string) => void
}) {
  const desktop = React.useMemo(() => isProbablyDesktop(), [])
  const [open, setOpen] = React.useState(false)
  const { t, locale } = useI18n()

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>{trigger}</SheetTrigger>
      <SheetContent
        side="bottom"
        className="h-[50vh] rounded-t-xl"
        onOpenAutoFocus={(e) => {
          // Prevent Radix from auto-focusing the first input (preset name) when opening the sheet.
          e.preventDefault();
        }}
      >
        {/* Add an accessible hidden title for the dialog */}
        <VisuallyHidden>
          <SheetTitle>{t("app.presets")}</SheetTitle>
        </VisuallyHidden>
        <SheetHeader className="flex-row items-center justify-between pr-12">
          <div className="flex items-center gap-2">
            <div className="font-semibold">{t("presets.savedTitle") + " (" + presets.length + ")"}</div>
          </div>
        </SheetHeader>
        <div className="flex flex-col gap-6 overflow-auto px-4 pb-4">
          <div className="flex flex-col gap-3">

            {presets.length === 0 ? (
              <div className="rounded-lg border p-4 text-sm text-muted-foreground">
                {t("presets.empty")}
              </div>
            ) : (
              <div className="flex flex-col gap-3">
                {presets.map((p) => (
                  <PresetCard
                    key={p.id}
                    preset={p}
                    desktop={desktop}
                    itemsById={itemsById}
                    locale={locale}
                    t={t}
                    onLoadPresetIntoCurrent={(id) => {
                      onLoadPresetIntoCurrent(id)
                      setOpen(false)
                    }}
                    onRenamePreset={onRenamePreset}
                    onDeletePreset={onDeletePreset}
                    onRemoveItemFromPreset={onRemoveItemFromPreset}
                  />
                ))}
              </div>
            )}
          </div>
        </div>
      </SheetContent>
    </Sheet>
  );
}

