#!/usr/bin/env bash

############################################################
#
# TERMINAL EXPLORER
# WEEK 1 INSTALLER
#
# This script creates the Week 1 challenge files.
#
# Students do not need to understand this script yet.
# Later in the course, this script can be used as a real
# example when learning Bash scripting.
#
############################################################

# Stop the script if something goes wrong.
#
# -e  = exit if a command fails
# -u  = exit if we use a variable that does not exist
# pipefail = detect errors inside command pipelines
set -euo pipefail

# Languages supported by the course.
SUPPORTED_LANGUAGES="en sv es ar"

# The key students must find to complete Week 1.
EXPECTED_KEY="THE_TERMINAL_IS_A_MAP"

# Find the directory where this script is located.
#
# If this script is:
#   terminal-explorer/weeks/week1.sh
#
# then SCRIPT_DIR becomes:
#   terminal-explorer/weeks
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find the root directory of the repository.
#
# Since week1.sh is inside the weeks/ directory,
# the repo root is one directory above it.
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Course files are installed in the student's home directory.
COURSE_DIR="$HOME/terminal-explorer"

# Week 1 files are installed here.
WEEK_DIR="$COURSE_DIR/week1"

# The Arabic rendering tool is stored inside the repo.
ARA_BIN="$REPO_ROOT/bin/ara"

############################################################
# LANGUAGE SELECTION
############################################################

# If no language argument is provided, show a menu.
#
# Example:
#   ./weeks/week1.sh
#
# If a language is provided, use it directly.
#
# Example:
#   ./weeks/week1.sh sv
if [ $# -eq 0 ]; then
    echo
    echo "Select language:"
    echo
    echo "1) English (en)"
    echo "2) Svenska (sv)"
    echo "3) Español (es)"
    echo "4) Arabic (ar)"
    echo

    read -rp "Choice [1-4]: " CHOICE

    case "$CHOICE" in
        1) LANGUAGE="en" ;;
        2) LANGUAGE="sv" ;;
        3) LANGUAGE="es" ;;
        4) LANGUAGE="ar" ;;
        *)
            echo "Invalid choice: $CHOICE"
            exit 1
            ;;
    esac
else
    LANGUAGE="$1"
fi

# Make sure the selected language is supported.
if [[ ! " $SUPPORTED_LANGUAGES " =~ " $LANGUAGE " ]]; then
    echo "Unsupported language: $LANGUAGE"
    echo "Supported languages: $SUPPORTED_LANGUAGES"
    echo
    echo "Example:"
    echo "bash weeks/week1.sh en"
    exit 1
fi

# This is where the translated Week 1 text files are stored.
LOCALE_DIR="$REPO_ROOT/locales/$LANGUAGE/week1"

# Make sure the selected locale directory exists.
if [ ! -d "$LOCALE_DIR" ]; then
    echo "Missing locale directory: $LOCALE_DIR"
    exit 1
fi

# These files must exist for every supported language.
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

# Check that every required translation file exists.
for file in "${required_files[@]}"; do
    if [ ! -f "$LOCALE_DIR/$file" ]; then
        echo "Missing locale file: $LOCALE_DIR/$file"
        exit 1
    fi
done

# Arabic requires the ara tool for better right-to-left rendering.
# The tool should exist in:
#
#   bin/ara
#
# We only require it when Arabic is selected.
if [ "$LANGUAGE" = "ar" ]; then
    if [ ! -x "$ARA_BIN" ]; then
        echo
        echo "Arabic language selected, but bin/ara is missing or not executable."
        echo
        echo "Expected:"
        echo "$ARA_BIN"
        echo
        echo "Fix:"
        echo "chmod +x bin/ara"
        echo
        exit 1
    fi
fi

############################################################
# INSTALL WEEK 1
############################################################

echo
echo "======================================"
echo " TERMINAL EXPLORER - WEEK 1"
echo "======================================"
echo
echo "Installing Week 1 using language: $LANGUAGE"
echo

# Create the main course directory if it does not exist.
mkdir -p "$COURSE_DIR"

# Save the chosen language so future weeks can reuse it.
echo "$LANGUAGE" > "$COURSE_DIR/language.txt"

# Remove any previous Week 1 installation.
#
# This makes the script safe to run again if a student wants
# to reset Week 1.
rm -rf "$WEEK_DIR"

# Create the directory structure for the mansion challenge.
mkdir -p "$WEEK_DIR/mansion/kitchen"
mkdir -p "$WEEK_DIR/mansion/bedroom"
mkdir -p "$WEEK_DIR/mansion/library/secret_passage/vault"

# Copy the translated files into the challenge world.
cp "$LOCALE_DIR/README.txt" "$WEEK_DIR/README.txt"
cp "$LOCALE_DIR/kitchen.txt" "$WEEK_DIR/mansion/kitchen/clue.txt"
cp "$LOCALE_DIR/bedroom.txt" "$WEEK_DIR/mansion/bedroom/clue.txt"
cp "$LOCALE_DIR/library.txt" "$WEEK_DIR/mansion/library/clue.txt"
cp "$LOCALE_DIR/secret_passage.txt" "$WEEK_DIR/mansion/library/secret_passage/clue.txt"
cp "$LOCALE_DIR/treasure.txt" "$WEEK_DIR/mansion/library/secret_passage/vault/treasure.txt"

# Copy localized completion messages into the installed Week 1 folder.
cp "$LOCALE_DIR/install_complete.txt" "$WEEK_DIR/install_complete.txt"
cp "$LOCALE_DIR/week1_complete.txt" "$WEEK_DIR/week1_complete.txt"

############################################################
# CREATE VIEW HELPER
############################################################

# The view helper lets all students read files with one command:
#
#   ./view README.txt
#
# For most languages, it uses cat.
# For Arabic, it uses bin/ara to render right-to-left text correctly.
if [ "$LANGUAGE" = "ar" ]; then
    cat > "$WEEK_DIR/view" << EOF
#!/usr/bin/env bash

# Arabic text needs special right-to-left rendering in many terminals.
# This helper uses the ara tool stored in the course repository.

set -euo pipefail

ARA_BIN="$ARA_BIN"

if [ "\${1:-}" = "" ]; then
    echo "Usage: ./view <file>"
    exit 1
fi

"\$ARA_BIN" -i "\$1"
EOF
else
    cat > "$WEEK_DIR/view" << 'EOF'
#!/usr/bin/env bash

# For left-to-right languages, normal cat output is enough.

set -euo pipefail

if [ "${1:-}" = "" ]; then
    echo "Usage: ./view <file>"
    exit 1
fi

cat "$1"
EOF
fi

chmod +x "$WEEK_DIR/view"

############################################################
# CREATE VERIFY SCRIPT
############################################################

# This script is placed inside ~/terminal-explorer/week1.
#
# Students run it after they find the key:
#
#   ./verify.sh THE_TERMINAL_IS_A_MAP
cat > "$WEEK_DIR/verify.sh" << 'EOF'
#!/usr/bin/env bash

# Stop if something goes wrong.
set -euo pipefail

# The correct Week 1 key.
EXPECTED_KEY="THE_TERMINAL_IS_A_MAP"

# Check whether the student supplied the correct key.
if [ "${1:-}" != "$EXPECTED_KEY" ]; then
    echo
    echo "Incorrect key."
    echo "Keep exploring the mansion."
    echo
    exit 1
fi

# Create a completion marker.
#
# Future weeks can check this file to confirm that Week 1
# has been completed.
touch .week1-complete

echo

# Display the localized completion message if it exists.
if [ -s "./week1_complete.txt" ]; then
    ./view ./week1_complete.txt
else
    echo "Week 1 complete."
    echo "You are ready for Week 2."
fi

echo
EOF

chmod +x "$WEEK_DIR/verify.sh"

############################################################
# FINISH
############################################################

# Display the localized installation message if it exists.
if [ -s "$WEEK_DIR/install_complete.txt" ]; then
    "$WEEK_DIR/view" "$WEEK_DIR/install_complete.txt"
else
    echo "Week 1 installed."
    echo
    echo "Start here:"
    echo "cd ~/terminal-explorer/week1"
    echo "./view README.txt"
fi

echo