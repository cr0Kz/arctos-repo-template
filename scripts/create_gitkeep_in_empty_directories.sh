#!/bin/bash

# Get the current working directory
CURRENT_DIR=$(pwd)

# Function to recursively create .gitkeep in all empty directories, ignoring the .git folder
create_gitkeep() {
  find "$CURRENT_DIR" -type d ! -path "*/.git/*" | while read -r dir; do
    if [ -z "$(ls -A "$dir")" ]; then
      touch "$dir/.gitkeep"
      echo "Created .gitkeep in $dir"
    fi
  done
}

# Run the function from the current working directory
create_gitkeep

echo ".gitkeep files created in all empty directories recursively from $CURRENT_DIR, ignoring the .git folder."
