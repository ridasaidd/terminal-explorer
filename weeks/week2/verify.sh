#!/usr/bin/env bash

set -euo pipefail

if [ -d "/workspaces" ]; then
    GAME_DIR="/workspaces/terminal-explorer-game"
else
    GAME_DIR="$HOME/terminal-explorer-game"
fi

WEEK_DIR="$GAME_DIR/week2"
MANOR="$GAME_DIR/manor"

fail=0

check_exists() {
    local path="$1"
    local description="$2"
    if [ -e "$path" ]; then
        echo "PASS: $description"
    else
        echo "MISSING: $description"
        fail=1
    fi
}

check_absent() {
    local path="$1"
    local description="$2"
    if [ ! -e "$path" ]; then
        echo "PASS: $description"
    else
        echo "STILL PRESENT: $description"
        fail=1
    fi
}

echo
echo "WEEK 2 — RESTORATION CHECK"
echo

check_exists "$MANOR/ground_floor/east_corridor/restoration_zone/restored_room" "restored_room directory exists"
check_exists "$MANOR/ground_floor/east_corridor/restoration_zone/restored_room/inventory.txt" "inventory.txt exists in restored_room"
check_exists "$MANOR/service_wing/workshop/blueprint.txt" "original blueprint remains in workshop"
check_exists "$MANOR/service_wing/archive/blueprint.txt" "blueprint was copied to archive"
check_absent "$MANOR/service_wing/workshop/broken_lamp.txt" "broken_lamp.txt moved out of workshop"
check_exists "$MANOR/service_wing/storage/repaired_lamp.txt" "lamp moved and renamed in storage"
check_absent "$MANOR/service_wing/workshop/obsolete_note.txt" "obsolete note removed"
check_absent "$MANOR/ground_floor/east_corridor/restoration_zone/rubble" "empty rubble directory removed"

if [ "$fail" -ne 0 ]; then
    echo
    echo "The estate is not fully restored yet."
    echo "Use pwd and ls to inspect the manor, then correct the missing steps."
    echo
    exit 1
fi

touch "$GAME_DIR/.week2-complete"
touch "$WEEK_DIR/.week2-complete"

echo
cat "$WEEK_DIR/week2_complete.txt"
echo
