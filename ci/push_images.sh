#!/usr/bin/env bash

set -eux

export VERSION=$PREVIEW_VERSION
export IMAGE_NAME=web
jx step post build --image ${DOCKER_REGISTRY}/${ORG}/web:${PREVIEW_VERSION}

export IMAGE_NAME=frontend
jx step post build --image ${DOCKER_REGISTRY}/${ORG}/frontend:${PREVIEW_VERSION}

export IMAGE_NAME=api
jx step post build --image ${DOCKER_REGISTRY}/${ORG}/api:${PREVIEW_VERSION}
