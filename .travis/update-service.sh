PRODUCTION_BRANCH="production"

if [[ $TRAVIS_BRANCH == $PRODUCTION_BRANCH ]]; then
  ./.travis/ecs-deploy.sh -c $ECS_CLUSTER -n $ECS_SERVICE -i $ECR_BASE_URI/$ECR_REPO_NAME:latest
else
  echo "Not deploying"
  exit
fi