#!/usr/bin/env bash

GRUB_THEMES_DIR="${GRUB_THEMES_DIR:-/boot/grub/themes}"
GRUB_DEFAULT_FILE="/etc/default/grub"

installer_check() {
    [[ "$EUID" -ne 0 ]] && {
        echo "Use sudo"
        exit 1
    }

    command -v update-grub >/dev/null || command -v grub-mkconfig >/dev/null || {
        echo "GRUB não encontrado"
        exit 1
    }

    [[ ! -f "$GRUB_DEFAULT_FILE" ]] && {
        echo "GRUB config não encontrado"
        exit 1
    }
}

installer_install() {
    local src="$1"
    local id="$2"
    local dest="$GRUB_THEMES_DIR/$id"

    rm -rf "$dest"
    mkdir -p "$dest"

    cp -r "$src/"* "$dest/"

    installer_set_theme "$dest/theme.txt"
    installer_update_grub
}

installer_set_theme() {
    local theme_path="$1"

    if grep -q "^GRUB_THEME=" "$GRUB_DEFAULT_FILE"; then
        sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"$theme_path\"|" "$GRUB_DEFAULT_FILE"
    else
        echo "GRUB_THEME=\"$theme_path\"" >> "$GRUB_DEFAULT_FILE"
    fi
}

installer_update_grub() {
    if command -v update-grub >/dev/null; then
        update-grub
    else
        grub-mkconfig -o /boot/grub/grub.cfg
    fi
}

installer_remove() {
    local id="$1"
    rm -rf "$GRUB_THEMES_DIR/$id"
    sed -i '/GRUB_THEME=/d' "$GRUB_DEFAULT_FILE"
    installer_update_grub
}