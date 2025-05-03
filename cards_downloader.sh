#!/bin/bash

# Directory containing Jekyll posts
POSTS_DIR="_i18n/pt/_posts"

# Directory to save thumbnails
THUMBNAILS_DIR="assets/img/cards"

# API endpoint for generating thumbnails
API_ENDPOINT="https://ionixjuniordevthumbnail.azurewebsites.net/api/Generate"

# Create the thumbnails directory if it doesn't exist
mkdir -p "$THUMBNAILS_DIR"

# Iterate over all Markdown files in the posts directory
find "$POSTS_DIR" -name "*.md" -print0 | while IFS= read -r -d $'\0' file; do
  # Extract the title from the front matter
  title=$(sed -n '/title: /,/---/p' "$file" | grep 'title: ' | sed 's/title: *"\(.*\)"/\1/')

  # URL encode the title
  encoded_title=$(printf '%s' "$title" | jq -sRr @uri)

  # Construct the API URL
  api_url="${API_ENDPOINT}?title=${encoded_title}"

  # Generate a filename for the thumbnail
  filename=$(basename "$file" .md)  # Extract filename without extension
  filename="${filename:11}.pt.png"   # Remove characters and add .png extension

  # Download the thumbnail using curl
  curl -s "$api_url" -o "$THUMBNAILS_DIR/$filename"
  echo "Downloaded thumbnail for '$title' to '$THUMBNAILS_DIR/$filename'"

  # Convert the PNG to WebP using cwebp
  cwebp "$THUMBNAILS_DIR/$filename" -q 60 -o "$THUMBNAILS_DIR/${filename%.png}.webp"


  # Optionally, remove the original PNG file
  rm "$THUMBNAILS_DIR/$filename" 

  echo "Downloaded and converted thumbnail for '$title' to '$THUMBNAILS_DIR/${filename%.png}.webp'"
  
  # Construct the social_image property
  social_image_line="social_image: \"${filename%.png}.webp\""
  # Add the social_image property to the front matter
  sed -i '' -E 's/^(\s*---\s*)$/'"$social_image_line"'\n\1/' "$file"
  # Delete the first line of the file
  sed -i '' '1d' "$file"

  echo "Downloaded and converted thumbnail for '$title' to '$THUMBNAILS_DIR/${filename%.png}.webp'"
  echo "Added 'social_image' property to '$file'"
  echo "-----------------------------------"
done