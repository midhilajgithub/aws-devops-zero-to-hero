#!/bin/bash
set -e

# Authenticate Docker to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 271136683822.dkr.ecr.ap-south-1.amazonaws.com

# Pull the Docker image from Docker Hub
docker pull simple_python_app/271136683822.dkr.ecr.ap-south-1.amazonaws.com/simple_python_app:latest

# Run the Docker image as a container
docker run -d -p 5000:5000 simple_python_app/271136683822.dkr.ecr.ap-south-1.amazonaws.com/simple_python_app:latest
