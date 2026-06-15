#!/usr/bin/env bash

set -euo pipefail

EXPECTED_KEY="THE_TERMINAL_IS_A_MAP"

if [ -d "/workspaces" ]; then
    GAME_DIR="/workspaces/terminal-explorer-game"
else
    GAME_DIR="$HOME/terminal-explorer-game"
fi

if [ "${1:-}" != "$EXPECTED_KEY" ]; then
    echo
    echo "Incorrect key."
    echo "Keep exploring the mansion."
    echo
    exit 1
fi

touch "$GAME_DIR/.week1-complete"
touch .week1-complete

echo

if [ -s "./week1_complete.txt" ]; then
    cat ./week1_complete.txt
else
    echo "Week 1 complete."
    echo "You are ready for Week 2."
fi

echo