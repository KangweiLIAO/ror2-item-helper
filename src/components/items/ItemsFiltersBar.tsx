"use client";

import * as React from "react";
import { SearchIcon } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { useI18n } from "@/i18n/LocaleProvider";
import { rarityLabel } from "@/i18n/ror2";
import { rarityStyle } from "@/lib/ror2-items";
import { cn } from "@/lib/utils";

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
  query: string;
  onQueryChange: (next: string) => void;
  rarities: Set<string>;
  allRarities: string[];
  onToggleRarity: (rarity: string, checked: boolean) => void;
  onReset: () => void;
  showingCount: number;
  totalCount: number;
  currentSelectedCount: number;
}) {
  const { locale, setLocale, t } = useI18n();

  const brandHref = `/?lang=${encodeURIComponent(locale)}`;

  return (
    <div className="sticky top-0 z-30 border-b bg-background/85 backdrop-blur">
      <div className="mx-auto w-full max-w-[1100px] px-3 py-3 sm:px-4">
        <div className="flex flex-col gap-3">
          <div className="flex items-center gap-2">
            <a
              href={brandHref}
              className="flex items-center gap-2 rounded-md px-2 py-1 transition-colors hover:bg-accent/60 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
              aria-label="Sharky's"
              title="Sharky's"
            >
              <img src="/favicon.png" alt="" className="size-8 rounded-sm" draggable={false} />
              <span className="hidden text-lg font-semibold leading-none sm:inline">Sharky&apos;s</span>
            </a>

            <div className="relative flex-1">
              <SearchIcon className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
              <input
                value={query}
                onChange={(e) => onQueryChange(e.target.value)}
                placeholder={t("filters.searchPlaceholder")}
                className="h-10 w-full rounded-md border bg-background pl-9 pr-3 text-sm outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
              />
            </div>

            <Button variant="default" onClick={onReset} className="h-10">
              {t("filters.reset")}
            </Button>

            <div className="flex items-stretch gap-2">
              <div
                className="flex h-10 overflow-hidden rounded-md border"
                aria-label={t("filters.language")}
                title={t("filters.language")}
              >
                <button
                  type="button"
                  aria-pressed={locale === "en"}
                  className={cn(
                    "h-full px-3 text-xs",
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
                  aria-pressed={locale === "zh-CN"}
                  className={cn(
                    "h-full px-3 text-xs",
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
          </div>

          <div className="flex flex-col gap-2">
            <div className="flex flex-wrap items-center gap-3">
              <div className="text-xs font-medium text-muted-foreground">{t("filters.rarity")}</div>
              <div className="flex flex-nowrap gap-2 overflow-x-auto pb-1 -mx-1 px-1 sm:mx-0 sm:px-0 sm:flex-wrap sm:overflow-visible">
                {allRarities.map((r) => {
                  const checked = rarities.has(r);
                  const style = rarityStyle(r);
                  return (
                    <label
                      key={r}
                      className={cn(
                        "flex shrink-0 cursor-pointer items-center gap-2 rounded-md px-2 py-1 text-sm transition",
                        "select-none ring-2 ring-inset",
                        style.ring,
                        checked ? cn("bg-accent", style.glow) : "bg-background",
                        "select-none"
                      )}
                    >
                      <Checkbox
                        checked={checked}
                        onCheckedChange={(v) => onToggleRarity(r, v === true)}
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
