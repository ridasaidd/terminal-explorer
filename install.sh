#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -d "/workspaces" ]; then
    GAME_DIR="/workspaces/terminal-explorer-game"
else
    GAME_DIR="$HOME/terminal-explorer-game"
fi

GAME_LINK="$HOME/terminal-explorer"
SUPPORTED_LANGUAGES="en sv es ar"

if [ -f "$GAME_DIR/language.txt" ]; then
    LANGUAGE="$(cat "$GAME_DIR/language.txt")"
    echo "Using saved language: $LANGUAGE"
else
    echo
    echo "Select language:"
    echo
    echo "1) English (en)"
    echo "2) Swedish (sv)"
    echo "3) Spanish (es)"
    echo "4) Arabic (ar)"
    echo

    read -rp "Choice [1-4]: " CHOICE

    case "$CHOICE" in
        1) LANGUAGE="en" ;;
        2) LANGUAGE="sv" ;;
        3) LANGUAGE="es" ;;
        4) LANGUAGE="ar" ;;
        *) echo "Invalid choice: $CHOICE"; exit 1 ;;
    esac
fi

if [[ ! " $SUPPORTED_LANGUAGES " =~ " $LANGUAGE " ]]; then
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi

mkdir -p "$GAME_DIR"
ln -sfn "$GAME_DIR" "$GAME_LINK"
echo "$LANGUAGE" > "$GAME_DIR/language.txt"

BACKPACK_DIR="$GAME_DIR/backpack"
mkdir -p "$BACKPACK_DIR"

create_backpack_file() {
    local file_path="$1"
    local title="$2"

    if [ ! -f "$file_path" ]; then
        cat > "$file_path" << EOF
$title
$(printf '=%.0s' $(seq 1 ${#title}))

This file belongs to you.

Use it to record what you discover during Terminal Explorer.
EOF
    fi
}

create_backpack_file "$BACKPACK_DIR/spellbook.txt" "SPELLBOOK"
create_backpack_file "$BACKPACK_DIR/journal.txt" "EXPLORER JOURNAL"
create_backpack_file "$BACKPACK_DIR/achievements.txt" "ACHIEVEMENTS"
create_backpack_file "$BACKPACK_DIR/lore.txt" "LORE"
create_backpack_file "$BACKPACK_DIR/discoveries.txt" "DISCOVERIES"

install_week() {
    local week_number="$1"
    local week_script="$SCRIPT_DIR/weeks/week${week_number}/install.sh"
    local marker_file="$GAME_DIR/.installed-week${week_number}"

    if [ -f "$marker_file" ]; then
        echo "Week $week_number already installed. Skipping."
        return
    fi

    if [ ! -x "$week_script" ]; then
        echo "Week $week_number script not found or not executable:"
        echo "$week_script"
        return
    fi

    echo
    echo "Installing Week $week_number..."
    "$week_script" "$LANGUAGE"

    touch "$marker_file"
    echo "Week $week_number installed."
}

install_week 1

echo
echo "Installation complete."
echo
echo "Game files installed here:"
echo "$GAME_DIR"
echo
echo "Shortcut:"
echo "$GAME_LINK"
echo
echo "Start here:"
echo "cd ~/terminal-explorer/week1"
echo "cat README.txt"
echo