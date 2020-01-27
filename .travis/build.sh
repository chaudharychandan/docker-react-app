#!/bin/bash -e

# Variables
REGISTRY_URL=${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com
SOURCE_IMAGE="${DOCKER_REPO}"
TARGET_IMAGE="${REGISTRY_URL}/${DOCKER_REPO}"
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"

# Build Image Using Cache
docker build --cache-from ${TARGET_IMAGE_LATEST} --tag ${SOURCE_IMAGE} .
