#!/bin/bash
# lc_rnm.sh
# lowercase all file names in directory

# checks for a directory path
if [ -z "$1" ]; then
	echo "Provide a directory to lowercase files"
	exit 1
fi

# switch to provided directory
cd "$1" || exit 1

# the main lowercasing script
for file in *; do
	# skip directories
	if [ -f "$file" ]; then

		# lowercase all
		newfile=$(echo "$file" | tr '[:upper:]' '[:lower:]')

		# rename the changed files
		if [ "$file" != "$newfile" ]; then
			mv -- "$file" "$newfile"
		fi
	fi
done
