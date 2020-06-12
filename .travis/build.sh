#!/bin/bash

PRODUCTION_BRANCH="production"

if [[ $TRAVIS_BRANCH == $PRODUCTION_BRANCH ]]; then
$(aws ecr get-login –no-include-email –region us-west-2) 
docker build -t lucmurakami/lucmurakami-website-backend .
docker tag lucmurakami/lucmurakami-website-backend:latest 164064335984.dkr.ecr.us-west-2.amazonaws.com/lucmurakami/lucmurakami-website-backend:latest
docker push 164064335984.dkr.ecr.us-west-2.amazonaws.com/lucmurakami/lucmurakami-website-backend:latest
else
  echo "Not deploying"
  exit
fi