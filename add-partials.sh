#!/bin/bash
# This function will update all html files in public directory with footer & menu from /partials folder
# to keep things consistent across different files. It runs every time any in /partials folder is updated. 
# You can also run it yourself with `bash add-partials.sh`

add_replace_footer() {
    footer_content="$(<partials/footer.html)"  # Read content from footer.html

    for file in public/*.html; do
        if [[ -f "$file" ]]; then
            # Replace existing footer content
            sed -i "s#<footer>.*</footer>#${footer_content}#g" "$file"
        fi
    done

    echo "Footer and menu update complete."
}

add_replace_footer
