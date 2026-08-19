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
REQUESTED_WEEK="${1:-1}"

if ! [[ "$REQUESTED_WEEK" =~ ^[0-9]+$ ]] || [ "$REQUESTED_WEEK" -lt 1 ]; then
    echo "Usage: ./install.sh [week-number]"
    echo "Example: ./install.sh 2"
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
        echo "Week $week_number already installed."
        return
    fi

    if [ ! -f "$week_script" ]; then
        echo "Week $week_number installer not found:"
        echo "$week_script"
        exit 1
    fi

    if [ "$week_number" -gt 1 ] && [ ! -f "$GAME_DIR/.installed-week$((week_number - 1))" ]; then
        echo "Install and complete the earlier week before extending the manor."
        echo "Run: ./install.sh $((week_number - 1))"
        exit 1
    fi

    echo
    echo "Installing Week $week_number..."
    bash "$week_script" "$LANGUAGE"
    touch "$marker_file"
    echo "Week $week_number installed."
}

install_week "$REQUESTED_WEEK"

echo
echo "======================================"
echo " TERMINAL EXPLORER"
echo "======================================"
echo
echo "Blackthorn Manor is ready."
echo "Active course language: English."
echo

if [ "$REQUESTED_WEEK" -eq 1 ]; then
    echo "Begin Week 1 here:"
    echo "cd ~/terminal-explorer/manor/ground_floor/entrance_hall"
    echo "cat clue.txt"
    echo
    echo "When it is time to extend the manor for Week 2:"
    echo "./install.sh 2"
elif [ "$REQUESTED_WEEK" -eq 2 ]; then
    echo "The service wing and restoration zone are now open."
    echo "Begin Week 2 here:"
    echo "cd ~/terminal-explorer/manor/service_wing/steward_office"
    echo "cat clue.txt"
fi

echo