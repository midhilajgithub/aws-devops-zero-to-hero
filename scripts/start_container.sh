#!/bin/bash
set -e
set -x
set +x

# Install jq
sudo apt-get update
sudo apt-get install -y jq

DOCKER_CREDENTIALS=$(aws secretsmanager get-secret-value --secret-id docker_Secrets_manager_credentials --region ap-south-1 --output json | jq -r .SecretString)
DOCKER_USERNAME=$(echo $DOCKER_CREDENTIALS | jq -r .username)
DOCKER_PASSWORD=$(echo $DOCKER_CREDENTIALS | jq -r .password)
DOCKER_URL=$(echo $DOCKER_CREDENTIALS | jq -r .url)

# Authenticate Docker to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username-stdin --password-stdin "$DOCKER_URL"

# Pull the Docker image from Docker Hub
docker pull "$DOCKER_URL"/simple_python_app:latest

# Run the Docker image as a container
docker run -d -p 5000:5000 "$DOCKER_URL"/simple_python_app:latest
