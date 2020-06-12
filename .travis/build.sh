#!/bin/bash

PRODUCTION_BRANCH="production"

if [[ $TRAVIS_BRANCH == $PRODUCTION_BRANCH ]]; then
  aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
  aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
  aws configure set default.region us-west-2

  $(aws ecr get-login –no-include-email –region us-west-2) 
  docker build -t $DOCKER_IMAGE .
  docker tag $DOCKER_IMAGE:latest $ECR_REPO_NAME:latest
  docker push $ECR_REPO_NAME:latest
else
  echo "Not deploying"
  exit
fi