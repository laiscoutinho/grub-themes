#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$ROOT_DIR/core/installer.sh"
source "$ROOT_DIR/core/preview.sh"

THEME_ID="${1:-}"

if [[ -z "$THEME_ID" ]]; then
  echo "Uso: grub-theme preview <theme>"
  exit 1
fi

THEME_PATH="$ROOT_DIR/themes/$THEME_ID"

if [[ ! -d "$THEME_PATH" ]]; then
  echo "Tema não encontrado"
  exit 1
fi

preview_init
preview_copy_theme "$THEME_PATH" "$THEME_ID"
preview_create_cfg
preview_build_iso
preview_run