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
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find the root directory of the repository.
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Course files are installed in the student's home directory.
COURSE_DIR="$HOME/terminal-explorer"

# Week 1 files are installed here.
WEEK_DIR="$COURSE_DIR/week1"

############################################################
# LANGUAGE SELECTION
############################################################

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
# install.sh protects students from accidental resets by skipping
# this script if Week 1 is already installed.
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
# CREATE VERIFY SCRIPT
############################################################

cat > "$WEEK_DIR/verify.sh" << 'EOF'
#!/usr/bin/env bash

# Stop if something goes wrong.
set -euo pipefail

# The correct Week 1 key.
EXPECTED_KEY="THE_TERMINAL_IS_A_MAP"

# Root course directory.
COURSE_DIR="$HOME/terminal-explorer"

# Check whether the student supplied the correct key.
if [ "${1:-}" != "$EXPECTED_KEY" ]; then
    echo
    echo "Incorrect key."
    echo "Keep exploring the mansion."
    echo
    exit 1
fi

# Create completion markers.
#
# The root marker is used by install.sh to unlock future weeks.
# The local marker is useful if the student explores this folder.
touch "$COURSE_DIR/.week1-complete"
touch .week1-complete

echo

# Display the localized completion message if it exists.
if [ -s "./week1_complete.txt" ]; then
    cat ./week1_complete.txt
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
    cat "$WEEK_DIR/install_complete.txt"
else
    echo "Week 1 installed."
    echo
    echo "Start here:"
    echo "cd ~/terminal-explorer/week1"
    echo "cat README.txt"
    echo
    echo "Arabic students: if terminal text is hard to read, use:"
    echo "code README.txt"
fi

echo