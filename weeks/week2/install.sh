#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEEKS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$WEEKS_DIR/.." && pwd)"

if [ -d "/workspaces" ]; then
    GAME_DIR="/workspaces/terminal-explorer-game"
else
    GAME_DIR="$HOME/terminal-explorer-game"
fi

GAME_LINK="$HOME/terminal-explorer"
WEEK_DIR="$GAME_DIR/week2"
MANOR="$GAME_DIR/manor"
LOCALE_DIR="$REPO_ROOT/locales/en/week2"

required_files=(
    "README.txt"
    "steward_office.txt"
    "workshop.txt"
    "east_wing.txt"
    "archive.txt"
    "storage.txt"
    "install_complete.txt"
    "week2_complete.txt"
)

for file in "${required_files[@]}"; do
    if [ ! -f "$LOCALE_DIR/$file" ]; then
        echo "Missing Week 2 content: $LOCALE_DIR/$file"
        exit 1
    fi
done

mkdir -p "$GAME_DIR" "$WEEK_DIR"
ln -sfn "$GAME_DIR" "$GAME_LINK"

if [ ! -d "$MANOR/ground_floor/entrance_hall" ]; then
    echo "Week 1 manor not found. Install Week 1 before Week 2."
    exit 1
fi

# Week 2 extends the existing manor without replacing Week 1 or student work.
mkdir -p "$MANOR/service_wing/steward_office"
mkdir -p "$MANOR/service_wing/workshop"
mkdir -p "$MANOR/service_wing/storage"
mkdir -p "$MANOR/service_wing/archive"
mkdir -p "$MANOR/ground_floor/east_corridor/restoration_zone/rubble"

cp "$LOCALE_DIR/README.txt" "$WEEK_DIR/README.txt"
cp "$LOCALE_DIR/week2_complete.txt" "$WEEK_DIR/week2_complete.txt"
cp "$LOCALE_DIR/install_complete.txt" "$WEEK_DIR/install_complete.txt"

cp "$LOCALE_DIR/steward_office.txt" "$MANOR/service_wing/steward_office/clue.txt"
cp "$LOCALE_DIR/workshop.txt" "$MANOR/service_wing/workshop/clue.txt"
cp "$LOCALE_DIR/east_wing.txt" "$MANOR/ground_floor/east_corridor/restoration_zone/clue.txt"
cp "$LOCALE_DIR/archive.txt" "$MANOR/service_wing/archive/clue.txt"
cp "$LOCALE_DIR/storage.txt" "$MANOR/service_wing/storage/clue.txt"

# Seed exercise objects only when absent so reinstalling later does not erase
# student work.
if [ ! -e "$MANOR/service_wing/workshop/blueprint.txt" ] && [ ! -e "$MANOR/service_wing/archive/blueprint.txt" ]; then
    cat > "$MANOR/service_wing/workshop/blueprint.txt" <<'EOF'
EAST WING RESTORATION BLUEPRINT

Preserve this record in the archive before restoration continues.
EOF
fi

if [ ! -e "$MANOR/service_wing/workshop/broken_lamp.txt" ] && [ ! -e "$MANOR/service_wing/storage/repaired_lamp.txt" ]; then
    cat > "$MANOR/service_wing/workshop/broken_lamp.txt" <<'EOF'
A brass lamp with a cracked glass shade.
It belongs in storage after it has been marked as repaired.
EOF
fi

if [ ! -e "$MANOR/service_wing/workshop/obsolete_note.txt" ]; then
    cat > "$MANOR/service_wing/workshop/obsolete_note.txt" <<'EOF'
OBSOLETE: East wing restoration has not yet begun.
EOF
fi

cp "$SCRIPT_DIR/verify.sh" "$WEEK_DIR/verify.sh"
chmod +x "$WEEK_DIR/verify.sh"

cat "$WEEK_DIR/install_complete.txt"
echo
echo "Week 2 extends the same Blackthorn Manor."
echo "Start here:"
echo "cd ~/terminal-explorer/manor/service_wing/steward_office"
echo "cat clue.txt"
echo