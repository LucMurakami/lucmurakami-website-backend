PRODUCTION_BRANCH="production"

if [[ $TRAVIS_BRANCH == $PRODUCTION_BRANCH ]]; then
  ECR_IMAGE_NAME=$ECR_BASE_URI/$ECR_REPO_NAME:latest
  ./.travis/ecs-deploy.sh -c $ECS_CLUSTER -n $ECS_SERVICE -i $ECR_IMAGE_NAME
else
  echo "Not deploying"
  exit
fi