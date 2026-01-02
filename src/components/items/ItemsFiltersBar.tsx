"use client"

import * as React from "react"
import { SearchIcon } from "lucide-react"

import { Button } from "@/components/ui/button"
import { useI18n } from "@/i18n/LocaleProvider"
import { rarityLabel } from "@/i18n/ror2"
import { cn } from "@/lib/utils"

export function ItemsFiltersBar({
  query,
  onQueryChange,
  rarities,
  allRarities,
  onToggleRarity,
  onReset,
  showingCount,
  totalCount,
  currentSelectedCount,
}: {
  query: string
  onQueryChange: (next: string) => void
  rarities: Set<string>
  allRarities: string[]
  onToggleRarity: (rarity: string, checked: boolean) => void
  onReset: () => void
  showingCount: number
  totalCount: number
  currentSelectedCount: number
}) {
  const { locale, setLocale, t } = useI18n()

  return (
    <div className="sticky top-0 z-30 border-b bg-background/85 backdrop-blur">
      <div className="mx-auto w-full max-w-[1100px] px-3 py-3 sm:px-4">
        <div className="flex flex-col gap-3">
          <div className="flex items-center gap-2">
            <div className="hidden items-center gap-2 sm:flex">
              <span className="text-xs text-muted-foreground">{t("filters.language")}</span>
              <div className="flex overflow-hidden rounded-md border">
                <button
                  type="button"
                  className={cn(
                    "px-2 py-1 text-xs",
                    locale === "en"
                      ? "bg-accent text-foreground"
                      : "bg-background text-muted-foreground"
                  )}
                  onClick={() => setLocale("en")}
                >
                  {t("filters.lang.en")}
                </button>
                <button
                  type="button"
                  className={cn(
                    "px-2 py-1 text-xs",
                    locale === "zh-CN"
                      ? "bg-accent text-foreground"
                      : "bg-background text-muted-foreground"
                  )}
                  onClick={() => setLocale("zh-CN")}
                >
                  {t("filters.lang.zh-CN")}
                </button>
              </div>
            </div>

            <div className="relative flex-1">
              <SearchIcon className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
              <input
                value={query}
                onChange={(e) => onQueryChange(e.target.value)}
                placeholder={t("filters.searchPlaceholder")}
                className="h-10 w-full rounded-md border bg-background pl-9 pr-3 text-sm outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
              />
            </div>

            <Button variant="secondary" onClick={onReset}>
              {t("filters.reset")}
            </Button>
          </div>

          {/* Mobile language switch (avoid crowding the top row) */}
          <div className="flex items-center justify-between gap-2 sm:hidden">
            <span className="text-xs text-muted-foreground">{t("filters.language")}</span>
            <div className="flex overflow-hidden rounded-md border">
              <button
                type="button"
                className={cn(
                  "px-2 py-1 text-xs",
                  locale === "en" ? "bg-accent text-foreground" : "bg-background text-muted-foreground"
                )}
                onClick={() => setLocale("en")}
              >
                {t("filters.lang.en")}
              </button>
              <button
                type="button"
                className={cn(
                  "px-2 py-1 text-xs",
                  locale === "zh-CN" ? "bg-accent text-foreground" : "bg-background text-muted-foreground"
                )}
                onClick={() => setLocale("zh-CN")}
              >
                {t("filters.lang.zh-CN")}
              </button>
            </div>
          </div>

          <div className="flex flex-col gap-2">
            <div className="flex flex-wrap items-center gap-3">
              <div className="text-xs font-medium text-muted-foreground">{t("filters.rarity")}</div>
              <div className="flex flex-nowrap gap-2 overflow-x-auto pb-1 -mx-1 px-1 sm:mx-0 sm:px-0 sm:flex-wrap sm:overflow-visible">
                {allRarities.map((r) => {
                  const checked = rarities.has(r);
                  return (
                    <label
                      key={r}
                      className={cn(
                        "flex shrink-0 cursor-pointer items-center gap-2 rounded-md border px-2 py-1 text-sm transition",
                        checked ? "bg-accent" : "bg-background",
                        "select-none"
                      )}
                    >
                      <input
                        type="checkbox"
                        checked={checked}
                        onChange={(e) => onToggleRarity(r, e.target.checked)}
                      />
                      <span className="text-sm">{rarityLabel(locale, r)}</span>
                    </label>
                  );
                })}
              </div>
            </div>
          </div>

          <div className="flex items-center justify-between text-xs text-muted-foreground">
            <div>{t("filters.showingCount", { showing: showingCount, total: totalCount })}</div>
            <div>{t("filters.currentPresetCount", { count: currentSelectedCount })}</div>
          </div>
        </div>
      </div>
    </div>
  );
}


