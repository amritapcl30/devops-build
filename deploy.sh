#!/bin/bash

ENV=$1
DOCKER_USER=amritapl

if [ "$ENV" == "dev" ]; then
  IMAGE_NAME=$DOCKER_USER/dev:latest
elif [ "$ENV" == "prod" ]; then
  IMAGE_NAME=$DOCKER_USER/prod:latest
else
  echo "Usage: ./deploy.sh dev|prod"
  exit 1
fi

echo "Stopping old container"
docker rm -f react-app || true

echo "Pulling image: $IMAGE_NAME"
docker pull $IMAGE_NAME

echo "Starting new container"
docker run -d -p 80:80 --name react-app $IMAGE_NAME
