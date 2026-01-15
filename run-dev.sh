#!/bin/bash
set -e

IMAGE="hugomods/hugo:latest"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Ensuring container system is running..."
container system start 2>/dev/null || true

echo "Pulling Hugo image..."
container image pull "$IMAGE"

echo "Starting Hugo development server at http://localhost:1313"
container run \
  --publish 1313:1313 \
  --volume "$SCRIPT_DIR/src:/src" \
  "$IMAGE" \
  server --bind 0.0.0.0 --baseURL=http://localhost:1313 --poll 700ms
