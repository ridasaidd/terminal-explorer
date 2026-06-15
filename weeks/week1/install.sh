#!/usr/bin/env bash

set -euo pipefail

SUPPORTED_LANGUAGES="en sv es ar"

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

if [ $# -eq 0 ]; then
    LANGUAGE="en"
else
    LANGUAGE="$1"
fi

if [[ ! " $SUPPORTED_LANGUAGES " =~ " $LANGUAGE " ]]; then
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi

LOCALE_DIR="$REPO_ROOT/locales/$LANGUAGE/week1"

if [ ! -d "$LOCALE_DIR" ]; then
    echo "Missing locale directory: $LOCALE_DIR"
    exit 1
fi

required_files=(
    "README.txt"
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
        echo "Missing locale file: $LOCALE_DIR/$file"
        exit 1
    fi
done

echo
echo "======================================"
echo " TERMINAL EXPLORER - WEEK 1"
echo "======================================"
echo
echo "Installing Week 1 using language: $LANGUAGE"
echo

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

cp "$LOCALE_DIR/README.txt" "$WEEK_DIR/README.txt"
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

ln -s secret_passage/vault "$WEEK_DIR/mansion/library/portal_to_vault"

cp "$SCRIPT_DIR/verify.sh" "$WEEK_DIR/verify.sh"
chmod +x "$WEEK_DIR/verify.sh"

if [ -s "$WEEK_DIR/install_complete.txt" ]; then
    cat "$WEEK_DIR/install_complete.txt"
else
    echo "Week 1 installed."
    echo
    echo "Start here:"
    echo "cd ~/terminal-explorer/week1"
    echo "cat README.txt"
fi

echo