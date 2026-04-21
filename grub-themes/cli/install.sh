#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$ROOT_DIR/core/ui.sh"
source "$ROOT_DIR/core/loader.sh"
source "$ROOT_DIR/core/customizer.sh"
source "$ROOT_DIR/core/installer.sh"

THEME_ID="${1:-}"

if [[ -z "$THEME_ID" ]]; then
  ui_error "Uso: grub-theme install <theme>"
  exit 1
fi

installer_check

THEMES_DIR="$ROOT_DIR/themes"
TMP_DIR="$(mktemp -d)"

trap 'rm -rf "$TMP_DIR"' EXIT

loader_load "$THEMES_DIR" "$THEME_ID"
customizer_load_pre "$THEME_CONFIG"
customizer_apply "$THEME_DIR" "$TMP_DIR"
installer_install "$TMP_DIR" "$THEME_ID"

ui_success "Tema instalado: $THEME_ID"