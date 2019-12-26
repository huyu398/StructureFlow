#!/bin/sh

DOCKER_BUILDKIT=1 \
    docker build \
    -t structure_flow .
