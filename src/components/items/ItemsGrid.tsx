"use client"

import * as React from "react"

import type { UiItem } from "@/lib/ror2-items"
import { ItemIcon } from "@/components/items/ItemIcon"

export function ItemsGrid({
  items,
  selectedIds,
  onToggleSelected,
  onOpenDetails,
}: {
  items: UiItem[]
  selectedIds: Set<string>
  onToggleSelected: (id: string) => void
  onOpenDetails: (id: string) => void
}) {
  return (
    <div className="grid grid-cols-6 gap-2 sm:grid-cols-8 sm:gap-3 md:grid-cols-10 lg:grid-cols-12">
      {items.map((it) => {
        const selected = selectedIds.has(it.id)
        return (
          <ItemIcon
            key={it.id}
            item={it}
            selected={selected}
            onOpenDetails={() => onOpenDetails(it.id)}
            onClick={() => onToggleSelected(it.id)}
          />
        )
      })}
    </div>
  )
}


