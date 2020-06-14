#!/bin/bash

PRODUCTION_BRANCH="production"

if [[ $TRAVIS_BRANCH == $PRODUCTION_BRANCH ]]; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install

  aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_BASE_URI
  docker build --cache-from $ECR_BASE_URI/$ECR_REPO_NAME:latest -t $ECR_REPO_NAME .
  docker tag $ECR_REPO_NAME:latest $ECR_BASE_URI/$ECR_REPO_NAME:latest
  docker push $ECR_BASE_URI/$ECR_REPO_NAME:latest
else
  echo "Not deploying"
  exit
fi