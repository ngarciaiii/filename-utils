#!/bin/bash
# rm_quotes_spaces.sh
# remove single quotes and spaces from files in directory

# checks for a directory path
if [ -z "$1" ]; then
	echo "Provide a directory to remove quotes from files"
	exit 1
fi

# switch to provided directory 
cd "$1" || exit 1

# the main script for quotes removal
for file in *; do
	# skip directories
	if [ -f "$file" ]; then

		# remove single quotes
		tempfile="${file//\'/}"

		# remove spaces
		newfile="${tempfile// /}"

		# rename the changed files
		if [ "$file" != "$newfile" ]; then
			mv -- "$file" "$newfile"
		fi
	fi
done
