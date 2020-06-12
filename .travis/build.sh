#!/bin/bash

PRODUCTION_BRANCH="production"

if [[ $TRAVIS_BRANCH == $PRODUCTION_BRANCH ]]; then
  aws configure set default.region us-west-2

  $(aws ecr get-login -–no-include-email) 
  docker build --cache-from $ECR_REPO_NAME:latest -t $DOCKER_IMAGE .
  docker tag $DOCKER_IMAGE:latest $ECR_REPO_NAME:latest
  docker push $ECR_REPO_NAME:latest
else
  echo "Not deploying"
  exit
fi