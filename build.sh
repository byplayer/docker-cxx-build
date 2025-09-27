#!/bin/bash
set -e  # Exit on error

IMAGE_NAME="byplayer/cxx-build"
TAG="${1:-latest}"
PUSH="${2:-false}"

FULL_IMAGE_NAME="$IMAGE_NAME:$TAG"

docker build --platform linux/amd64 ./ -t "$FULL_IMAGE_NAME"
echo "Successfully built: $FULL_IMAGE_NAME"

if [ "$PUSH" = "push" ]; then
    echo "Pushing $FULL_IMAGE_NAME to registry..."
    docker push "$FULL_IMAGE_NAME"
    echo "Successfully pushed: $FULL_IMAGE_NAME"
fi

