#!/usr/bin/env bash

PREVIEW_DIR="/tmp/grub-preview"
ISO_DIR="$PREVIEW_DIR/iso"
THEMES_DIR="$ISO_DIR/boot/grub/themes"
ISO_OUT="$PREVIEW_DIR/grub-preview.iso"

preview_init() {
    rm -rf "$PREVIEW_DIR"
    mkdir -p "$THEMES_DIR"
}

preview_copy_theme() {
    local theme_path="$1"
    local theme_id="$2"

    local dest="$THEMES_DIR/$theme_id"

    mkdir -p "$dest"

    cp -r "$theme_path/." "$dest/"
}

preview_create_cfg() {
cat > "$ISO_DIR/boot/grub/grub.cfg" <<EOF
set timeout=3
set default=0

menuentry "GRUB Theme Preview" {
    echo "Loading theme preview..."
    sleep 1
}
EOF
}

preview_build_iso() {
    grub-mkrescue -o "$ISO_OUT" "$ISO_DIR" >/dev/null 2>&1
}

preview_run() {
    qemu-system-x86_64 -cdrom "$ISO_OUT"
}