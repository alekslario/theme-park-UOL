#!/bin/bash


add_replace_footer() {
    footer_content="$(<partials/footer.html)"  # Read content from footer.html
    menu_content="$(<partials/menu.html)"  # Read content from footer.html

    for file in public/*.html; do
        if [[ -f "$file" ]]; then
            # Replace existing footer content
            sed -i "s#<footer>.*</footer>#${footer_content}#g" "$file"
            sed -i "s#<menu>.*</menu>#${menu_content}#g" "$file"
        fi
    done

    echo "Footer and menu update complete."
}

add_replace_footer