#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$ROOT_DIR/core/ui.sh"
source "$ROOT_DIR/core/installer.sh"

THEME_ID="${1:-}"

if [[ -z "$THEME_ID" ]]; then
  ui_error "Uso: grub-theme remove <theme>"
  exit 1
fi

installer_check
installer_remove "$THEME_ID"

ui_success "Tema removido: $THEME_ID"