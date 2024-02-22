#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull simple_python_app/271136683822.dkr.ecr.ap-south-1.amazonaws.com/simple_python_app:latest

# Run the Docker image as a container
docker run -d -p 5000:5000 simple_python_app/271136683822.dkr.ecr.ap-south-1.amazonaws.com/simple_python_app:latest
