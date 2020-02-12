#!/bin/bash -e

# Region Setup
aws configure set default.region ${AWS_DEFAULT_REGION}

# Docker Login to ECR
$(aws ecr get-login --no-include-email)
