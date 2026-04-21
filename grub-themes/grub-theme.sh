#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CORE="$ROOT_DIR/core"
CLI="$ROOT_DIR/cli"

CMD="${1:-}"

case "$CMD" in
  install)
    shift
    bash "$CLI/install.sh" "$@"
    ;;
  preview)
    shift
    bash "$CLI/preview.sh" "$@"
    ;;
  remove)
    shift
    bash "$CLI/remove.sh" "$@"
    ;;
  list)
    bash "$CLI/list.sh"
    ;;
  info)
    shift
    bash "$CLI/info.sh" "$@"
    ;;
  *)
    echo "Usage: grub-theme {install|preview|remove|list|info}"
    exit 1
    ;;
esac