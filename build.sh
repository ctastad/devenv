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

# Build the Docker image with the specified base image
docker build --build-arg BASE_IMAGE="$BASE_IMAGE" -t my-custom-image .

echo "Docker image built with base image: $BASE_IMAGE"

