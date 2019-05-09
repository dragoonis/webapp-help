#!/usr/bin/env bash

set -eux

export VERSION=$PREVIEW_VERSION
skaffold build --filename skaffold.yaml --profile web
skaffold build --filename skaffold.yaml --profile frontend
# skaffold build --filename skaffold.yaml --profile api
