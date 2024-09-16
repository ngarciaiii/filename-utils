#!/bin/bash
# file_cleaner.sh
# lowercase and remove quotes/spaces from files in directory

# checks for a directory path
if [ -z "$1" ]; then
    echo "Provide a directory to process file names."
    exit 1
fi

# switch to the provided directory
cd "$1" || exit 1

# the main script to lowercase and quotes/spaces removal
for file in *; do

    # skip directories
    if [ -f "$file" ]; then

        # remove single quotes and spaces
        tempfile="${file//\'/}"
        tempfile="${tempfile// /}"
        

        # lowercase all
        newfile=$(echo "$tempfile" | tr '[:upper:]' '[:lower:]')

        # rename the changed files
        if [ "$file" != "$newfile" ]; then
            mv -- "$file" "$newfile"
        fi
    fi
done
