#!/usr/bin/env bash

# ─────────────────────────────────────────────
# CORE UI (GRUB THEME ENGINE)
# by @laiscoutinho
# ─────────────────────────────────────────────

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
DIM="\033[2m"

ui_banner() {
    clear

    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════╗"
    echo "║        GRUB THEME ENGINE            ║"
    echo "║        by @laiscoutinho             ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${RESET}"

    echo -e "${DIM}repo: github.com/laiscoutinho/grub-themes${RESET}"
    echo -e "${DIM}cli : grub-theme <command>${RESET}"
    echo ""
}

ui_info() {
    echo -e "${DIM}[i]${RESET} $1"
}

ui_error() {
    echo -e "${RED}[x]${RESET} $1"
}

ui_success() {
    echo -e "${GREEN}[✓]${RESET} $1"
}

ui_loading() {
    local msg="$1"
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'

    echo -ne "${CYAN}$msg${RESET} "

    for i in {1..12}; do
        local c=${spin:i%10:1}
        echo -ne "\r${CYAN}$msg ${c}${RESET}"
        sleep 0.08
    done

    echo -e "\r${GREEN}✓ $msg${RESET}"
}

ui_fade_in() {
    local text="$1"

    for ((i=0; i<${#text}; i++)); do
        echo -ne "${text:$i:1}"
        sleep 0.01
    done

    echo ""
}