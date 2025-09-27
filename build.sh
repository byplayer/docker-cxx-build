#!/bin/bash
set -e  # Exit on error

IMAGE_NAME="${1:-byplayer/cxx-build}"
docker build ./ -t "$IMAGE_NAME"
echo "Successfully built: $IMAGE_NAME"