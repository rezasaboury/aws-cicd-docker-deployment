#!/bin/bash

set -e

APP_NAME="aws-cicd-demo"
IMAGE_NAME="aws-cicd-demo"

echo "Stopping old container if it exists..."
docker stop $APP_NAME || true
docker rm $APP_NAME || true

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

echo "Starting new container..."
docker run -d --name $APP_NAME -p 80:80 $IMAGE_NAME

echo "Deployment completed successfully."