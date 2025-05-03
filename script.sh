#!/bin/bash

remove_special_chars() {
  local text="$1"
  local clean_text=$(echo "$text" | tr '[:upper:]' '[:lower:]') 
  clean_text=$(echo "$clean_text" | tr -dc '[:alnum:][:space:]')
  clean_text=$(echo "$clean_text" | tr ' ' '-') 
  echo "$clean_text"
}

create_blog_post_file() {
  local filename="$1"
  local title="$2"
  local date="$3"
  local tags="$4"

  cat << EOF > "$filename"
---
layout: post
title:  "$title"
date:   $date
translations: ["en"]
tags: ["$tags"]
---
EOF

  echo "File '$filename' created with blog post template."
}

read -p "Enter the post date (format: yyyy-mm-dd): " post_date
read -p "Enter the post name: " title
file_name="$post_date-$(remove_special_chars "$title").md"

create_blog_post_file "_i18n/en/_posts/$file_name" "$title" "$post_date" "git"
create_blog_post_file "_i18n/pt/_posts/$file_name" "$title" "$post_date" "git"

