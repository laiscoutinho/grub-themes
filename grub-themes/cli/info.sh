#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THEME_ID="${1:-}"

if [[ -z "$THEME_ID" ]]; then
  echo "Uso: grub-theme info <theme>"
  exit 1
fi

CFG="$ROOT_DIR/themes/$THEME_ID/config.json"

if [[ ! -f "$CFG" ]]; then
  echo "Tema não encontrado"
  exit 1
fi

cat "$CFG"