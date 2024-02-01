#!/bin/bash

# Check if a base image was passed as an argument
if [ "$#" -eq 1 ]; then
    BASE_IMAGE=$1
else
    # Prompt the user for the base image if not provided as an argument
    echo "Enter the base image (e.g., ubuntu:latest):"
    read BASE_IMAGE
fi

# Check if the base image variable is empty
if [ -z "$BASE_IMAGE" ]; then
    echo "Base image cannot be empty."
    exit 1
fi

# Check if a base image was passed as an argument
if [ "$#" -eq 2 ]; then
    IMAGE_NAME=$2
else
    # Prompt the user for the base image if not provided as an argument
    echo "Enter the image name"
    read IMAGE_NAME
fi

# Check if the base image variable is empty
if [ -z "$IMAGE_NAME" ]; then
    echo "Image name cannot be empty."
    exit 1
fi

# Example Docker build command
docker build --build-arg BASE_IMAGE="$BASE_IMAGE" -t "$IMAGE_NAME" .

echo "Docker image $IMAGE_NAME built successfully with $BASE_IMAGE."

