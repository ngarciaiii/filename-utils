#!/bin/bash
# lc_rm_quotes.sh
# lowercase and remove quotes from files in directory

# checks for a directory path
if [ -z "$1" ]; then
    echo "Provide a directory to process file names."
    exit 1
fi

# switch to the provided directory
cd "$1" || exit 1

# the main script to lowercase and quotes removal
for file in *; do

    # skip directories
    if [ -f "$file" ]; then

        # remove single and double quotes
        tempfile="${file//\'/}"
        tempfile="${tempfile//\"/}"

        # lowercase all
        newfile=$(echo "$tempfile" | tr '[:upper:]' '[:lower:]')

        # rename the changed files
        if [ "$file" != "$newfile" ]; then
            mv -- "$file" "$newfile"
        fi
    fi
done
