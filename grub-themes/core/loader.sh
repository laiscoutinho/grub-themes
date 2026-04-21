#!/usr/bin/env bash

loader_load() {
    local dir="$1"
    local id="$2"

    THEME_DIR="$dir/$id"
    THEME_CONFIG="$THEME_DIR/config.json"

    [[ ! -d "$THEME_DIR" ]] && {
        echo "Tema não existe"
        exit 1
    }

    [[ ! -f "$THEME_CONFIG" ]] && {
        echo "config.json faltando"
        exit 1
    }

    THEME_NAME=$(jq -r '.name' "$THEME_CONFIG")
}