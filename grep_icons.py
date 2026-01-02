import argparse
import json
import os
import time
from typing import Dict, List, Optional, Tuple

import requests

WIKI = "https://riskofrain2.fandom.com"
API = f"{WIKI}/api.php"
DEFAULT_OUT_DIR = "public/icons"
DEFAULT_MAPPING_FILE = "public/items-assets.json"
DEFAULT_ITEMS_JSON = "public/data/items.json"
DEFAULT_CATEGORY = "Category:Item_Icons"


def api_get(session: requests.Session, params: dict) -> dict:
    params = {**params, "format": "json", "formatversion": 2}
    r = session.get(API, params=params, timeout=30)
    r.raise_for_status()
    return r.json()


def list_category_files(session: requests.Session, category_title: str) -> List[str]:
    files: List[str] = []
    cont = None
    while True:
        params = {
            "action": "query",
            "list": "categorymembers",
            "cmtitle": category_title,
            "cmnamespace": 6,  # File:
            "cmlimit": 500,
        }
        if cont:
            params["cmcontinue"] = cont
        data = api_get(session, params)
        files.extend([x["title"] for x in data["query"]["categorymembers"]])
        cont = data.get("continue", {}).get("cmcontinue")
        if not cont:
            break
        time.sleep(0.2)
    return files


def get_image_url(session: requests.Session, title: str) -> Optional[str]:
    data = api_get(
        session,
        {
            "action": "query",
            "titles": title,
            "prop": "imageinfo",
            "iiprop": "url",
        },
    )
    page = data["query"]["pages"][0]
    if "imageinfo" not in page:
        return None
    return page["imageinfo"][0]["url"]


def search_file_titles(session: requests.Session, query: str, limit: int = 5) -> List[str]:
    """Search within File: namespace and return candidate titles like 'File:Foo.png'."""
    data = api_get(
        session,
        {
            "action": "query",
            "list": "search",
            "srsearch": query,
            "srnamespace": 6,  # File:
            "srlimit": limit,
        },
    )
    return [x["title"] for x in data.get("query", {}).get("search", [])]


def resolve_item_icon(session: requests.Session, item_name: str) -> Optional[Tuple[str, str]]:
    """
    Try to resolve an item name to an image URL.
    Returns (filename, url) where filename excludes the 'File:' prefix.
    """
    # First try direct, common filenames
    direct_titles = [
        f"File:{item_name}.png",
        f"File:{item_name}.jpg",
        f"File:{item_name}.jpeg",
        f"File:{item_name}.webp",
    ]
    for t in direct_titles:
        url = get_image_url(session, t)
        if url:
            return (t.replace("File:", ""), url)

    # Fallback: search within File: titles
    # Prefer exact-ish matches that contain the item name.
    candidates = search_file_titles(
        session, f'intitle:"{item_name}"', limit=10)
    for t in candidates:
        url = get_image_url(session, t)
        if not url:
            continue
        filename = t.replace("File:", "")
        # Basic filter: prefer pngs and avoid obviously unrelated files
        if filename.lower().endswith(".png"):
            return (filename, url)

    # Last resort: broader search term
    candidates = search_file_titles(session, item_name, limit=10)
    for t in candidates:
        url = get_image_url(session, t)
        if not url:
            continue
        filename = t.replace("File:", "")
        if filename.lower().endswith(".png"):
            return (filename, url)

    return None


def download(session: requests.Session, url: str, out_path: str, overwrite: bool) -> None:
    if (not overwrite) and os.path.exists(out_path):
        return
    r = session.get(url, timeout=60)
    r.raise_for_status()
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "wb") as f:
        f.write(r.content)


def load_items(items_json_path: str) -> List[str]:
    if not os.path.exists(items_json_path):
        return []
    with open(items_json_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    names: List[str] = []
    for row in data:
        n = row.get("name")
        if isinstance(n, str) and n.strip():
            names.append(n.strip())
    return names


def load_mapping(mapping_file: str) -> Dict[str, str]:
    if not os.path.exists(mapping_file):
        return {}
    with open(mapping_file, "r", encoding="utf-8") as f:
        return json.load(f)


def save_mapping(mapping_file: str, mapping: Dict[str, str]) -> None:
    os.makedirs(os.path.dirname(mapping_file), exist_ok=True)
    with open(mapping_file, "w", encoding="utf-8") as f:
        json.dump(mapping, f, ensure_ascii=False, indent=2)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--out-dir", default=DEFAULT_OUT_DIR)
    ap.add_argument("--mapping-file", default=DEFAULT_MAPPING_FILE)
    ap.add_argument("--items-json", default=DEFAULT_ITEMS_JSON)
    ap.add_argument("--category", default=DEFAULT_CATEGORY)
    ap.add_argument("--only-missing", action="store_true", default=True)
    ap.add_argument("--no-only-missing", dest="only_missing",
                    action="store_false")
    ap.add_argument("--overwrite", action="store_true", default=False)
    ap.add_argument("--rate", type=float, default=0.2,
                    help="Sleep seconds between requests to avoid rate limiting")
    args = ap.parse_args()

    session = requests.Session()
    session.headers.update(
        {"user-agent": "ror2-items-helper/0.1 (personal project)"})

    mapping = load_mapping(args.mapping_file)

    # 1) Crawl category icons (bulk refresh)
    files = list_category_files(session, args.category)
    for title in files:
        url = get_image_url(session, title)
        if not url:
            continue
        filename = title.replace("File:", "")
        out_path = os.path.join(args.out_dir, filename)
        download(session, url, out_path, overwrite=args.overwrite)
        mapping[filename] = out_path.replace("\\", "/")
        time.sleep(args.rate)

    # 2) Fill missing icons by item names from items.json
    item_names = load_items(args.items_json)
    for name in item_names:
        key = f"{name}.png"
        if args.only_missing and key in mapping:
            continue
        resolved = resolve_item_icon(session, name)
        if not resolved:
            continue
        filename, url = resolved
        out_path = os.path.join(args.out_dir, filename)
        download(session, url, out_path, overwrite=args.overwrite)
        mapping[filename] = out_path.replace("\\", "/")
        time.sleep(args.rate)

    save_mapping(args.mapping_file, mapping)
    print(f"Done. mapping size={len(mapping)} -> {args.mapping_file}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
