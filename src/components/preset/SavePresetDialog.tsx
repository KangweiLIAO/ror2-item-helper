"use client"

import * as React from "react"

import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog"
import { useI18n } from "@/i18n/LocaleProvider"

export function SavePresetDialog({
  open,
  onOpenChange,
  name,
  onNameChange,
  selectedCount,
  onSave,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  name: string
  onNameChange: (name: string) => void
  selectedCount: number
  onSave: () => void
}) {
  const { t } = useI18n()
  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-[calc(100%-3rem)] sm:max-w-md">
        <DialogHeader>
          <DialogTitle>{t("saveDialog.title")}</DialogTitle>
          <DialogDescription>{t("saveDialog.desc", { count: selectedCount })}</DialogDescription>
        </DialogHeader>
        <div className="space-y-2">
          <label className="text-sm font-medium">{t("saveDialog.nameLabel")}</label>
          <input
            value={name}
            onChange={(e) => onNameChange(e.target.value)}
            className="h-10 w-full rounded-md border bg-background px-3 text-sm outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
            autoFocus
          />
        </div>
        <DialogFooter>
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            {t("common.cancel")}
          </Button>
          <Button onClick={onSave}>{t("common.save")}</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}


