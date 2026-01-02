"use client"

import * as React from "react"
import { CheckIcon, InfoIcon } from "lucide-react"

import type { UiItem } from "@/lib/ror2-items"
import { clampToThreeLines, isProbablyDesktop, rarityStyle } from "@/lib/ror2-items"
import { Badge } from "@/components/ui/badge"
import { Tooltip, TooltipContent, TooltipTrigger } from "@/components/ui/tooltip"
import { useI18n } from "@/i18n/LocaleProvider"
import { rarityLabel } from "@/i18n/ror2"
import { cn } from "@/lib/utils"

export function ItemIcon({
  item,
  selected,
  onClick,
  onDragStart,
  onOpenDetails,
}: {
  item: UiItem
  selected: boolean
  onClick: () => void
  onDragStart: (e: React.DragEvent) => void
  onOpenDetails: () => void
}) {
  const style = rarityStyle(item.rarity)
  const desktop = React.useMemo(() => isProbablyDesktop(), [])
  const { t, locale } = useI18n()

  const content = (
    <button
      type="button"
      className={cn(
        "group relative aspect-square w-full overflow-hidden rounded-xl bg-zinc-950/5 dark:bg-white/5",
        "ring-2 ring-inset transition",
        style.ring,
        style.glow,
        selected && "ring-4 ring-inset ring-primary/70"
      )}
      draggable={desktop}
      onDragStart={onDragStart}
      onClick={desktop ? onClick : onOpenDetails}
      onDoubleClick={() => {
        if (!desktop) return
        onOpenDetails()
      }}
      onKeyDown={(e) => {
        if (!desktop) return
        if (e.key === "Enter" && e.shiftKey) {
          e.preventDefault()
          onOpenDetails()
        }
      }}
    >
      <img
        src={item.icon}
        alt={item.name}
        className="h-full w-full object-contain p-1"
        loading="lazy"
        draggable={false}
      />
      {selected && (
        <div className="absolute top-1 right-1 grid size-6 place-items-center rounded-full bg-primary text-primary-foreground shadow-sm">
          <CheckIcon className="size-4" />
        </div>
      )}
      <div className="pointer-events-none absolute inset-0 opacity-0 transition-opacity group-hover:opacity-100">
        <div className="absolute inset-0 bg-gradient-to-t from-black/25 to-transparent" />
      </div>
    </button>
  )

  if (!desktop) return content

  return (
    <Tooltip delayDuration={300}>
      <TooltipTrigger asChild>{content}</TooltipTrigger>
      <TooltipContent sideOffset={8} className="max-w-[340px] rounded-lg px-3 py-2 text-xs">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <div className="flex items-center gap-2">
              <div className={cn("font-semibold", style.text)}>{item.name}</div>
              <Badge variant="secondary" className="shrink-0">
                {rarityLabel(locale, item.rarity)}
              </Badge>
            </div>
            <div className="mt-1 text-background/90">
              <p className="line-clamp-3 leading-5">{clampToThreeLines(item.description)}</p>
              <div className="mt-1 flex items-center gap-1 text-background/80">
                <InfoIcon className="size-3.5" />
                <span>{t("itemIcon.doubleClickHint")}</span>
              </div>
            </div>
          </div>
        </div>
      </TooltipContent>
    </Tooltip>
  )
}


