"use client"

import * as React from "react"

import type { UiItem } from "@/lib/ror2-items"
import { rarityStyle } from "@/lib/ror2-items"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog"
import { Sheet, SheetContent, SheetDescription, SheetHeader, SheetTitle } from "@/components/ui/sheet"
import { cn } from "@/lib/utils"
import { useI18n } from "@/i18n/LocaleProvider"
import { rarityLabel } from "@/i18n/ror2"

export function ItemDetailsDialog({
  open,
  onOpenChange,
  item,
  selected,
  onToggleSelected,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  item: UiItem | null
  selected: boolean
  onToggleSelected: () => void
}) {
  const { t, locale } = useI18n()
  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-xl">
        <DialogHeader>
          <DialogTitle>{item?.name ?? t("details.fallbackTitle")}</DialogTitle>
          <DialogDescription>{item ? rarityLabel(locale, item.rarity) : ""}</DialogDescription>
        </DialogHeader>
        {item ? (
          <div className="space-y-4">
            <div className="flex items-start gap-4">
              <div
                className={cn(
                  "size-20 shrink-0 rounded-xl ring-2 ring-inset",
                  rarityStyle(item.rarity).ring,
                  rarityStyle(item.rarity).glow
                )}
              >
                <img src={item.icon} alt={item.name} className="h-full w-full object-contain p-2" />
              </div>
              <div className="min-w-0">
                <p className="text-sm leading-6">{item.description}</p>
                {item.categories?.length ? (
                  <div className="mt-3 flex flex-wrap gap-2">
                    {item.categories.slice(0, 8).map((c) => (
                      <Badge key={c} variant="secondary">
                        {c}
                      </Badge>
                    ))}
                  </div>
                ) : null}
              </div>
            </div>
          </div>
        ) : null}
        <DialogFooter>
          {item ? (
            <Button onClick={onToggleSelected}>
              {selected ? t("details.remove") : t("details.add")}
            </Button>
          ) : null}
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}

export function ItemDetailsSheet({
  open,
  onOpenChange,
  item,
  selected,
  onToggleSelected,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  item: UiItem | null
  selected: boolean
  onToggleSelected: () => void
}) {
  const { t, locale } = useI18n()
  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent side="bottom" className="h-[70vh]">
        <SheetHeader>
          <SheetTitle>{item?.name ?? t("details.fallbackTitle")}</SheetTitle>
          <SheetDescription>{item ? rarityLabel(locale, item.rarity) : ""}</SheetDescription>
        </SheetHeader>
        {item ? (
          <div className="flex h-full flex-col gap-4 overflow-auto px-4 pb-6">
            <div className="flex items-start gap-4">
              <div
                className={cn(
                  "size-20 shrink-0 rounded-xl ring-2 ring-inset",
                  rarityStyle(item.rarity).ring,
                  rarityStyle(item.rarity).glow
                )}
              >
                <img src={item.icon} alt={item.name} className="h-full w-full object-contain p-2" />
              </div>
              <p className="text-sm leading-6">{item.description}</p>
            </div>
            {item.categories?.length ? (
              <div className="flex flex-wrap gap-2">
                {item.categories.map((c) => (
                  <Badge key={c} variant="secondary">
                    {c}
                  </Badge>
                ))}
              </div>
            ) : null}
            <div className="mt-auto">
              <Button
                className="w-full"
                onClick={() => {
                  onToggleSelected()
                  onOpenChange(false)
                }}
              >
                {selected ? t("details.remove") : t("details.add")}
              </Button>
            </div>
          </div>
        ) : null}
      </SheetContent>
    </Sheet>
  )
}


