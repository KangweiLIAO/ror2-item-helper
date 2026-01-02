"use client"

import * as React from "react"
import { XIcon } from "lucide-react"
import { toast } from "sonner"

import type { Preset } from "@/lib/presets"
import type { UiItem } from "@/lib/ror2-items"
import { isProbablyDesktop, rarityStyle } from "@/lib/ror2-items"
import { Button } from "@/components/ui/button"
import {
  Sheet,
  SheetContent,
  SheetTrigger,
  SheetTitle,
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
  // eslint-disable-next-line no-alert
  window.prompt("Copy URL", text)
}

export function PresetsSheet({
  trigger,
  presets,
  itemsById,
  onLoadPresetIntoCurrent,
  onRenamePreset,
  onDeletePreset,
  onAddItemToPreset,
  onRemoveItemFromPreset,
  onDragStartItem,
  canAcceptDrop,
  readDraggedItemId,
}: {
  trigger: React.ReactNode
  presets: Preset[]
  itemsById: Map<string, UiItem>
  onLoadPresetIntoCurrent: (presetId: string) => void
  onRenamePreset: (presetId: string, name: string) => void
  onDeletePreset: (presetId: string) => void
  onAddItemToPreset: (presetId: string, itemId: string) => void
  onRemoveItemFromPreset: (presetId: string, itemId: string) => void
  onDragStartItem: (e: React.DragEvent, itemId: string) => void
  canAcceptDrop: (e: React.DragEvent) => boolean
  readDraggedItemId: (e: React.DragEvent) => string | null
}) {
  const desktop = React.useMemo(() => isProbablyDesktop(), [])
  const [open, setOpen] = React.useState(false)
  const { t, locale } = useI18n()

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>{trigger}</SheetTrigger>
      <SheetContent
        side="bottom"
        className="h-[85vh]"
        onOpenAutoFocus={(e) => {
          // Prevent Radix from auto-focusing the first input (preset name) when opening the sheet.
          e.preventDefault();
        }}
      >
        {/* Add an accessible hidden title for the dialog */}
        <VisuallyHidden>
          <SheetTitle>{t("app.presets")}</SheetTitle>
        </VisuallyHidden>
        <div className="flex flex-col gap-6 overflow-auto px-4 py-14">
          <div className="flex flex-col gap-3">
            <div className="flex items-center justify-between">
              <div className="font-semibold">{t("presets.savedTitle")}</div>
              <div className="text-sm text-muted-foreground">{presets.length}</div>
            </div>

            {presets.length === 0 ? (
              <div className="rounded-lg border p-4 text-sm text-muted-foreground">
                {t("presets.empty")}
              </div>
            ) : (
              <div className="flex flex-col gap-3">
                {presets.map((p) => (
                  <div
                    key={p.id}
                    className="rounded-lg border p-4"
                    onDragOver={(e) => {
                      if (!desktop) return;
                      if (!canAcceptDrop(e)) return;
                      e.preventDefault();
                    }}
                    onDrop={(e) => {
                      if (!desktop) return;
                      const id = readDraggedItemId(e);
                      if (!id) return;
                      e.preventDefault();
                      onAddItemToPreset(p.id, id);
                    }}
                  >
                    <div className="flex flex-col gap-3">
                      <div className="flex flex-wrap items-start justify-between gap-3">
                        <div className="flex-1">
                          <input
                            value={p.name}
                            onChange={(e) => onRenamePreset(p.id, e.target.value)}
                            className="h-9 w-full rounded-md border bg-background px-3 text-sm font-medium outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
                          />
                          <div className="mt-1 text-xs text-muted-foreground">
                            {t("presets.meta", {
                              count: p.itemIds.length,
                              date: new Date(p.createdAt).toLocaleDateString(
                                locale === "zh-CN" ? "zh-CN" : "en"
                              ),
                            })}
                          </div>
                        </div>
                        <div className="flex items-center gap-2">
                          <Button
                            variant="default"
                            onClick={() => {
                              onLoadPresetIntoCurrent(p.id);
                              setOpen(false);
                            }}
                          >
                            {t("presets.load")}
                          </Button>
                          <Button
                            variant="outline"
                            onClick={async () => {
                              try {
                                const url = buildShareUrl(p.itemIds);
                                await copyToClipboard(url);
                                toast.success(t("share.copied"));
                              } catch {
                                toast.error(t("share.copyFailed"));
                              }
                            }}
                          >
                            {t("share.share")}
                          </Button>
                          <Button variant="destructive" onClick={() => onDeletePreset(p.id)}>
                            {t("presets.delete")}
                          </Button>
                        </div>
                      </div>

                      {p.itemIds.length === 0 ? (
                        <div className="text-sm text-muted-foreground">
                          {t("presets.itemsEmpty")}
                        </div>
                      ) : (
                        <div className="flex flex-wrap gap-2">
                          {p.itemIds.map((id) => {
                            const it = itemsById.get(id);
                            if (!it) return null;
                            const style = rarityStyle(it.rarity);
                            return (
                              <div
                                key={id}
                                className={cn(
                                  "relative size-12 rounded-xl bg-zinc-950/5 dark:bg-white/5 ring-2 ring-inset",
                                  style.ring,
                                  style.glow
                                )}
                                draggable={desktop}
                                onDragStart={(e) => onDragStartItem(e, id)}
                                title={it.name}
                              >
                                <img
                                  src={it.icon}
                                  alt={it.name}
                                  className="h-full w-full object-contain p-1.5"
                                  draggable={false}
                                />
                                <button
                                  type="button"
                                  className="absolute -top-1 -right-1 grid size-5 place-items-center rounded-full bg-background/90 text-foreground shadow"
                                  onClick={() => onRemoveItemFromPreset(p.id, id)}
                                >
                                  <XIcon className="size-3" />
                                </button>
                              </div>
                            );
                          })}
                        </div>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </SheetContent>
    </Sheet>
  );
}

