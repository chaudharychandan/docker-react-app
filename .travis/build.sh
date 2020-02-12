#!/bin/bash -e

# Variables
REGISTRY_URL=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com
SOURCE_IMAGE="${AWS_REPOSITORY_NAME}"
TARGET_IMAGE="${REGISTRY_URL}/${AWS_REPOSITORY_NAME}"
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"

# Build Image Using Cache
docker build --cache-from ${TARGET_IMAGE_LATEST} --tag ${SOURCE_IMAGE} .
