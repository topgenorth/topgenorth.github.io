#!/bin/bash

# convert-html-to-md.sh
# Converts all *.html files in current directory to .md in /home/tom/Code/topgenorth.github.io.2/content/archives/
# Run from directory containing your HTML files.

TARGET_DIR="/home/tom/Code/topgenorth.github.io.2/content/archives"

# Check if target directory exists, create if not
if [ ! -d "$TARGET_DIR" ]; then
  echo "Creating target directory: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"
fi

# Check for pandoc
if ! command -v pandoc &> /dev/null; then
  echo "Error: pandoc not found. Install with 'sudo apt install pandoc' or 'brew install pandoc'."
  exit 1
fi

# Convert all *.html files
for html_file in *.html; do
  if [ -f "$html_file" ]; then
    base_name="${html_file%.html}"
    md_file="$TARGET_DIR/${base_name}.md"
    
    echo "Converting $html_file -> $md_file"
    
    pandoc -f html -t gfm -s --wrap=none -o "$md_file" "$html_file"
    
    if [ $? -eq 0 ]; then
      echo "✓ Success: $md_file"
    else
      echo "✗ Failed: $html_file"
    fi
  fi
done

echo "Conversion complete. Check $TARGET_DIR for .md files."
