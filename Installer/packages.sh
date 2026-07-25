#!/bin/bash

# Define the package list file
PKG_FILE="pkgs.txt"

# Check if the package list file exists
if [ ! -f "$PKG_FILE" ]; then
    echo "Error: $PKG_FILE not found!"
    exit 1
fi

# Check if yay is installed before proceeding
if ! command -v yay &> /dev/null; then
    echo "Error: yay is not installed. Please install it first."
    exit 1
fi

echo "Updating system and installing packages from $PKG_FILE..."

# Filter out comments and empty lines, then pass to yay
grep -v -E '^#|^$' "$PKG_FILE" | xargs yay -S --needed --noconfirm

echo "Installation complete!"
