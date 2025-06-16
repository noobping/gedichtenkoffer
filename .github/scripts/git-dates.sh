#!/usr/bin/env bash
# For each .md under content/, except _index.md, if it has +++ front matter
# but no date field, look up its Git “creation” date and insert it.
find content/ -type f -name '*.md' ! -name '_index.md' | while read -r file; do
    # Only process files with +++ front matter
    if grep -q '^+++ *$' "$file"; then
        # Check for an existing date = in the first front‐matter block
        if ! awk 'BEGIN{i=0}
              /^\+\+\+ *$/ { i++; next }
              i==1 && /^date *=/ { found=1; exit }
        END { exit !found }' "$file"; then
            
            echo "Adding creation date to $file"
            
            # Ask Git for the ISO‐8601 author date of the very first commit that added this file
            creation_date=$(git log --diff-filter=A --follow --format=%ad --date=format:'%Y-%m-%d' -1 -- "$file" 2>/dev/null)
            
            # Fallback to today if Git has no history for this (e.g. untracked file)
            if [ -z "$creation_date" ]; then
                creation_date=$(date +'%Y-%m-%d')
            fi
            
            # Insert the date line immediately after the opening +++ of front matter
            awk -v date="$creation_date" '
        BEGIN { added=0 }
        /^\+\+\+ *$/ && !added {
            print
            print "date = \"" date "\""
            added=1
            next
        }
        { print }
            ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
        fi
    fi
done
