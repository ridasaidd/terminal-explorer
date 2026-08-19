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
WEEK_DIR="$GAME_DIR/week1"
LANGUAGE="en"
LOCALE_DIR="$REPO_ROOT/locales/en/week1"

required_files=(
    "README.txt"
    "entrance_hall.txt"
    "kitchen.txt"
    "bedroom.txt"
    "library.txt"
    "secret_passage.txt"
    "treasure.txt"
    "install_complete.txt"
    "week1_complete.txt"
)

for file in "${required_files[@]}"; do
    if [ ! -f "$LOCALE_DIR/$file" ]; then
        echo "Missing Chapter 1 content: $LOCALE_DIR/$file"
        exit 1
    fi
done

mkdir -p "$GAME_DIR"
ln -sfn "$GAME_DIR" "$GAME_LINK"
echo "$LANGUAGE" > "$GAME_DIR/language.txt"

rm -rf "$WEEK_DIR"

mkdir -p "$WEEK_DIR/mansion/entrance_hall"
mkdir -p "$WEEK_DIR/mansion/kitchen"
mkdir -p "$WEEK_DIR/mansion/bedroom"
mkdir -p "$WEEK_DIR/mansion/library/secret_passage/vault"
mkdir -p "$WEEK_DIR/mansion/observatory"
mkdir -p "$WEEK_DIR/mansion/.old_wing"

# A short out-of-world orientation remains available at the chapter root.
cp "$LOCALE_DIR/README.txt" "$WEEK_DIR/README.txt"

# The playable adventure begins here.
cp "$LOCALE_DIR/entrance_hall.txt" "$WEEK_DIR/mansion/entrance_hall/clue.txt"
cp "$LOCALE_DIR/kitchen.txt" "$WEEK_DIR/mansion/kitchen/clue.txt"
cp "$LOCALE_DIR/bedroom.txt" "$WEEK_DIR/mansion/bedroom/clue.txt"
cp "$LOCALE_DIR/library.txt" "$WEEK_DIR/mansion/library/clue.txt"
cp "$LOCALE_DIR/secret_passage.txt" "$WEEK_DIR/mansion/library/secret_passage/clue.txt"
cp "$LOCALE_DIR/treasure.txt" "$WEEK_DIR/mansion/library/secret_passage/vault/treasure.txt"

if [ -f "$LOCALE_DIR/library_hidden_note.txt" ]; then
    cp "$LOCALE_DIR/library_hidden_note.txt" "$WEEK_DIR/mansion/library/.hidden_note.txt"
fi

if [ -f "$LOCALE_DIR/forgotten_letter.txt" ]; then
    cp "$LOCALE_DIR/forgotten_letter.txt" "$WEEK_DIR/mansion/.old_wing/forgotten_letter.txt"
fi

cp "$LOCALE_DIR/install_complete.txt" "$WEEK_DIR/install_complete.txt"
cp "$LOCALE_DIR/week1_complete.txt" "$WEEK_DIR/week1_complete.txt"

# A real symbolic link becomes a portal later in the exploration.
ln -s secret_passage/vault "$WEEK_DIR/mansion/library/portal_to_vault"

cp "$SCRIPT_DIR/verify.sh" "$WEEK_DIR/verify.sh"
chmod +x "$WEEK_DIR/verify.sh"

if [ -s "$WEEK_DIR/install_complete.txt" ]; then
    cat "$WEEK_DIR/install_complete.txt"
else
    echo "Chapter 1 installed."
    echo "Start here:"
    echo "cd ~/terminal-explorer/week1/mansion/entrance_hall"
    echo "cat clue.txt"
fi

echo