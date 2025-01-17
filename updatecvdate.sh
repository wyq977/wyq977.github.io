#!/bin/bash

# Accept file paths as arguments
file="$1"          # Jemdoc file path (e.g., index.jemdoc)
date_file="$2"     # Resume PDF path (e.g., static/resume.pdf)

# Verify if the files exist
if [ ! -f "$date_file" ]; then
    echo "Error: File $date_file does not exist."
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Error: File $file does not exist."
    exit 1
fi

# Get the modification date of the specified file in "YYYY MMM DD" format
file_date=$(stat -f '%Sm' -t '%Y %b %d' "$date_file")

# Define the new string with the modification date
new_string='\\[[https://github.com/wyq977/ Github]\\] ~~~ \\[[static/resume.pdf CV], '"$file_date"'\\]\\n'

# Debug: Show the new string
echo "New string to be inserted: $new_string"

# Check if the modification date is different from the one in the file
if ! grep -q "$file_date" "$file"; then
    # Use awk to replace the line with the new date
    awk -v new_date="$new_string" '
    {
        if ($0 ~ /static\/resume.pdf CV/) {
            print new_date
        } else {
            print $0
        }
    }
    ' "$file" > temp_file && mv temp_file "$file"
    echo "Date updated to $file_date in $file."
else
    echo "No update needed, the date is already $file_date."
fi
