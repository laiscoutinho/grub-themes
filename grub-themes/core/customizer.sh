#!/usr/bin/env bash

declare -A CUSTOM_VALUES

customizer_apply() {
    local theme="$1"
    local out="$2"

    cp -r "$theme/"* "$out/"

    local theme_txt="$out/theme.txt"

    for k in "${!CUSTOM_VALUES[@]}"; do
        [[ "$k" == placeholder:* ]] && continue

        local val="${CUSTOM_VALUES[$k]}"
        local ph="${CUSTOM_VALUES[placeholder:$k]}"

        [[ -n "$val" && -n "$ph" ]] && {
            sed -i "s|$ph|$val|g" "$theme_txt"
        }
    done
}

customizer_load_pre() {
    local cfg="$1"

    while IFS='|' read -r f p; do
        CUSTOM_VALUES["$f"]=""
        CUSTOM_VALUES["placeholder:$f"]="$p"
    done < <(
        jq -r '.customizable[] | "\(.field)|\(.placeholder)"' "$cfg"
    )
}