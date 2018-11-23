#!/usr/bin/env bash

# Prerequisite
# Make sure you set secret enviroment variables in Travis CI
# DOCKER_USERNAME
# DOCKER_PASSWORD

set -ex

Usage() {
  echo "$0 [TAG]"
}

IMAGE="alpine/assume-role"
TAG=${1:-latest}

docker build --no-cache -t ${IMAGE}:${TAG} .

if [[ "$TRAVIS_BRANCH" == "master" ]]; then
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
  docker push ${IMAGE}:${TAG}
  docker push ${IMAGE}:${TAG}
fi
