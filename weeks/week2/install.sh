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

mkdir -p "$GAME_DIR"
ln -sfn "$GAME_DIR" "$GAME_LINK"
rm -rf "$WEEK_DIR"

mkdir -p "$WEEK_DIR/manor/steward_office"
mkdir -p "$WEEK_DIR/manor/workshop"
mkdir -p "$WEEK_DIR/manor/storage"
mkdir -p "$WEEK_DIR/manor/archive"
mkdir -p "$WEEK_DIR/manor/east_wing/rubble"

cp "$LOCALE_DIR/README.txt" "$WEEK_DIR/README.txt"
cp "$LOCALE_DIR/steward_office.txt" "$WEEK_DIR/manor/steward_office/clue.txt"
cp "$LOCALE_DIR/workshop.txt" "$WEEK_DIR/manor/workshop/clue.txt"
cp "$LOCALE_DIR/east_wing.txt" "$WEEK_DIR/manor/east_wing/clue.txt"
cp "$LOCALE_DIR/archive.txt" "$WEEK_DIR/manor/archive/clue.txt"
cp "$LOCALE_DIR/storage.txt" "$WEEK_DIR/manor/storage/clue.txt"
cp "$LOCALE_DIR/install_complete.txt" "$WEEK_DIR/install_complete.txt"
cp "$LOCALE_DIR/week2_complete.txt" "$WEEK_DIR/week2_complete.txt"

cat > "$WEEK_DIR/manor/workshop/blueprint.txt" <<'EOF'
EAST WING RESTORATION BLUEPRINT

Preserve this record in the archive before restoration continues.
EOF

cat > "$WEEK_DIR/manor/workshop/broken_lamp.txt" <<'EOF'
A brass lamp with a cracked glass shade.
It belongs in storage after it has been marked as repaired.
EOF

cat > "$WEEK_DIR/manor/workshop/obsolete_note.txt" <<'EOF'
OBSOLETE: East wing restoration has not yet begun.
EOF

cp "$SCRIPT_DIR/verify.sh" "$WEEK_DIR/verify.sh"
chmod +x "$WEEK_DIR/verify.sh"

cat "$WEEK_DIR/install_complete.txt"
