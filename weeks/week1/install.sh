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
MANOR="$GAME_DIR/manor"
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
mkdir -p "$WEEK_DIR"

# Week 1 establishes the persistent manor. Do not destroy an existing manor,
# because later weeks and student work extend this same filesystem world.
mkdir -p "$MANOR/ground_floor/entrance_hall/cloakroom"
mkdir -p "$MANOR/ground_floor/west_corridor/kitchen/pantry"
mkdir -p "$MANOR/ground_floor/west_corridor/dining_room"
mkdir -p "$MANOR/ground_floor/east_corridor/bedroom/dressing_room"
mkdir -p "$MANOR/ground_floor/east_corridor/library/reading_room"
mkdir -p "$MANOR/ground_floor/east_corridor/library/archives/family_records"
mkdir -p "$MANOR/ground_floor/east_corridor/library/archives/estate_records"
mkdir -p "$MANOR/ground_floor/east_corridor/library/secret_passage/old_staircase/vault"
mkdir -p "$MANOR/upper_floor/gallery"
mkdir -p "$MANOR/upper_floor/guest_wing"
mkdir -p "$MANOR/upper_floor/observatory"
mkdir -p "$MANOR/underground/cellar"
mkdir -p "$MANOR/underground/old_tunnel"
mkdir -p "$MANOR/.old_wing"

# Week-specific orientation remains outside the playable manor.
cp "$LOCALE_DIR/README.txt" "$WEEK_DIR/README.txt"
cp "$LOCALE_DIR/week1_complete.txt" "$WEEK_DIR/week1_complete.txt"
cp "$LOCALE_DIR/install_complete.txt" "$WEEK_DIR/install_complete.txt"

# Core playable clues are distributed through the larger map.
cp "$LOCALE_DIR/entrance_hall.txt" "$MANOR/ground_floor/entrance_hall/clue.txt"
cp "$LOCALE_DIR/kitchen.txt" "$MANOR/ground_floor/west_corridor/kitchen/clue.txt"
cp "$LOCALE_DIR/bedroom.txt" "$MANOR/ground_floor/east_corridor/bedroom/clue.txt"
cp "$LOCALE_DIR/library.txt" "$MANOR/ground_floor/east_corridor/library/clue.txt"
cp "$LOCALE_DIR/secret_passage.txt" "$MANOR/ground_floor/east_corridor/library/secret_passage/clue.txt"
cp "$LOCALE_DIR/treasure.txt" "$MANOR/ground_floor/east_corridor/library/secret_passage/old_staircase/vault/treasure.txt"

if [ -f "$LOCALE_DIR/library_hidden_note.txt" ]; then
    cp "$LOCALE_DIR/library_hidden_note.txt" "$MANOR/ground_floor/east_corridor/library/.hidden_note.txt"
fi

if [ -f "$LOCALE_DIR/forgotten_letter.txt" ]; then
    cp "$LOCALE_DIR/forgotten_letter.txt" "$MANOR/.old_wing/forgotten_letter.txt"
fi

cat > "$MANOR/upper_floor/observatory/navigation_note.txt" <<'EOF'
THE OBSERVATORY

From here, try three different ways to think about a destination.

.  means here
.. means one level up
~  means your home directory
/  means the root of the whole filesystem

Use pwd before and after moving. Do not memorize an address that belongs to someone else's computer.
EOF

cat > "$MANOR/ground_floor/west_corridor/kitchen/pantry/path_note.txt" <<'EOF'
THE PANTRY

A relative path is directions from where you are now.
An absolute path is a complete address beginning at /.
A path beginning with ~ starts from your home directory.

The same room can be reached using different path descriptions.
EOF

# Real symbolic links act as portals. Students use them before learning to
# create links themselves.
ln -sfn ../../underground/old_tunnel "$MANOR/upper_floor/observatory/old_lift"
ln -sfn secret_passage/old_staircase/vault "$MANOR/ground_floor/east_corridor/library/portal_to_vault"

cp "$SCRIPT_DIR/verify.sh" "$WEEK_DIR/verify.sh"
chmod +x "$WEEK_DIR/verify.sh"

if [ -s "$WEEK_DIR/install_complete.txt" ]; then
    cat "$WEEK_DIR/install_complete.txt"
else
    echo "Chapter 1 installed."
fi

echo
echo "Start here:"
echo "cd ~/terminal-explorer/manor/ground_floor/entrance_hall"
echo "cat clue.txt"
echo