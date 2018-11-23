SHELL := /bin/bash

IMAGE ?= alpine/assume-role
RELEASE_TYPE ?= patch

CURRENT_VERSION := $(shell git ls-remote --tags | awk '{ print $$2}'| sort -nr | head -n1|sed 's/refs\/tags\///g')

ifndef CURRENT_VERSION
  CURRENT_VERSION := 0.0.0
endif

NEXT_VERSION := $(shell docker run --rm alpine/semver semver -c -i $(RELEASE_TYPE) $(CURRENT_VERSION))

current-version:
	@echo $(CURRENT_VERSION)

next-version:
	@echo $(NEXT_VERSION)

docker_push:
	bash ./build.sh $(NEXT_VERSION)

git_tag:
	docker push $(IMAGE):$(NEXT_VERSION)
	git checkout master;
	git tag $(NEXT_VERSION)
	git push --tags
