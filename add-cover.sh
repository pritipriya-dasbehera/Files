#!/bin/bash

poster="logo.webp"
output_dir="output"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

for file in *.mkv; do
  output="$output_dir/$file"

  # Store original timestamp
  original_timestamp=$(stat -c %y "$file")

  # Process with ffmpeg
  ffmpeg -i "$file" -attach "$poster" -metadata:s:t mimetype=image/jpeg -metadata:s:t title="cover" \
-map 0:v -map 0:a -map 0:s -c copy "$output"

  # Restore the original timestamp
  touch -d "$original_timestamp" "$output"
done
