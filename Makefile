.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z_-]+:.*?## / {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
SHELL:=/bin/bash

# DOCKER TASKS
ubuntu-18.04-opengl-base:
	@printf "\033[33mBuilding Docker Image: codookie/ubuntu-18.04-opengl-base\033[0m\n"
	docker build -f Dockerfile.opengl.base -t codookie/ubuntu-18.04-opengl-base .
	@printf "\033[92mDone.\033[0m\n\n"
ubuntu-18.04-udsfnd-lidar-full: ubuntu-18.04-opengl-base
	@printf "\033[33mBuilding Docker Image: codookie/ubuntu-18.04-udsfnd-lidar-full\033[0m\n"
	docker build --build-arg USER_ID=$(shell id -u) --build-arg GROUP_ID=$(shell id -g) --build-arg USERNAME=docker \
		-f Dockerfile.opengl.full -t codookie/ubuntu-18.04-udsfnd-lidar-full .
	@printf "\033[92mDone.\033[0m\n\n"

