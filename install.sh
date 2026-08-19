#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -d "/workspaces" ]; then
    GAME_DIR="/workspaces/terminal-explorer-game"
else
    GAME_DIR="$HOME/terminal-explorer-game"
fi

GAME_LINK="$HOME/terminal-explorer"
LANGUAGE="en"

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
Use it however you find useful while exploring Terminal Explorer.
EOF
    fi
}

create_backpack_file "$BACKPACK_DIR/commands.txt" "COMMAND NOTES"
create_backpack_file "$BACKPACK_DIR/journal.txt" "EXPLORER JOURNAL"
create_backpack_file "$BACKPACK_DIR/discoveries.txt" "DISCOVERIES"
create_backpack_file "$BACKPACK_DIR/notes.txt" "NOTES"

install_week() {
    local week_number="$1"
    local week_script="$SCRIPT_DIR/weeks/week${week_number}/install.sh"
    local marker_file="$GAME_DIR/.installed-week${week_number}"

    if [ -f "$marker_file" ]; then
        echo "Week $week_number already installed. Skipping."
        return
    fi

    if [ ! -x "$week_script" ]; then
        echo "Week $week_number installer not found or not executable:"
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
install_week 2

echo
echo "======================================"
echo " TERMINAL EXPLORER"
echo "======================================"
echo
echo "Blackthorn Manor is ready."
echo
echo "For the V2 rework, the active course language is English."
echo
echo "Start with Week 1:"
echo "cd ~/terminal-explorer/week1/mansion/entrance_hall"
echo "cat clue.txt"
echo
echo "After Week 1, begin Week 2 here:"
echo "cd ~/terminal-explorer/week2/manor/steward_office"
echo "cat clue.txt"
echo