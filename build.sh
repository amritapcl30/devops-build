#!/bin/bash

ENV=$1
DOCKER_USER=amritapl

if [ "$ENV" == "dev" ]; then
  IMAGE_NAME=$DOCKER_USER/dev:latest
elif [ "$ENV" == "prod" ]; then
  IMAGE_NAME=$DOCKER_USER/prod:latest
else
  echo "Usage: ./build.sh dev|prod"
  exit 1
fi

echo "Building image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

echo "Pushing image to Docker Hub"
docker push $IMAGE_NAME
