#!/usr/bin/env bash

############################################################
#
# TERMINAL EXPLORER INSTALLER
#
# This script installs the course environment.
#
# It does not solve challenges.
# It only prepares the weekly worlds.
#
############################################################

set -euo pipefail

COURSE_DIR="$HOME/terminal-explorer"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SUPPORTED_LANGUAGES="en sv es ar"

############################################################
# LANGUAGE SELECTION
############################################################

if [ -f "$COURSE_DIR/language.txt" ]; then
    LANGUAGE="$(cat "$COURSE_DIR/language.txt")"
    echo "Using saved language: $LANGUAGE"
else
    echo
    echo "Select language:"
    echo
    echo "1) English (en)"
    echo "2) Swedish (sv)"
    echo "3) Spanish (es)"
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
fi

if [[ ! " $SUPPORTED_LANGUAGES " =~ " $LANGUAGE " ]]; then
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi

mkdir -p "$COURSE_DIR"
echo "$LANGUAGE" > "$COURSE_DIR/language.txt"

############################################################
# INSTALL WEEK HELPER
############################################################

install_week() {
    local week_number="$1"
    local week_script="$SCRIPT_DIR/weeks/week${week_number}.sh"
    local marker_file="$COURSE_DIR/.installed-week${week_number}"

    if [ -f "$marker_file" ]; then
        echo "Week $week_number already installed. Skipping."
        return
    fi

    if [ ! -x "$week_script" ]; then
        echo "Week $week_number script not found or not executable:"
        echo "$week_script"
        return
    fi

    echo
    echo "Installing Week $week_number..."
    "$week_script" "$LANGUAGE"

    touch "$marker_file"

    echo "Week $week_number installed."
}

############################################################
# INSTALL AVAILABLE WEEKS
############################################################

install_week 1

echo
echo "Installation complete."
echo
echo "Start here:"
echo "cd ~/terminal-explorer/week1"
echo "cat README.txt"
echo