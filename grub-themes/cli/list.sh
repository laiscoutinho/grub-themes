#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THEMES_DIR="$ROOT_DIR/themes"

for dir in "$THEMES_DIR"/*; do
  [[ -d "$dir" ]] || continue
  echo "$(basename "$dir")"
done