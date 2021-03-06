#!/usr/bin/env sh

SCRIPT_DIR="$(
    cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit
    pwd -P
)"

ORG="rodones"
NAME="colmap"
VERSION="latest"
DOCKER_FILE="$SCRIPT_DIR/Dockerfile"

CUDA_ENABLED=""

BASE_IMAGE_BUILD=""
BASE_IMAGE_BUILD_CUDA="nvidia/cuda:10.2-devel-ubuntu18.04"
BASE_IMAGE_BUILD_WITHOUT_CUDA="ubuntu:bionic"

BASE_IMAGE=""
BASE_IMAGE_CUDA="nvidia/cuda:10.2-runtime-ubuntu18.04"
BASE_IMAGE_WITHOUT_CUDA="ubuntu:bionic"

if [ "$1" = "--with-cuda" ]; then
    CUDA_ENABLED="ON"
    VERSION="gpu-$VERSION"
    BASE_IMAGE="$BASE_IMAGE_CUDA"
    BASE_IMAGE_BUILD="$BASE_IMAGE_BUILD_CUDA"
elif [ "$1" = "--without-cuda" ]; then
    CUDA_ENABLED="OFF"
    VERSION="cpu-$VERSION"
    BASE_IMAGE="$BASE_IMAGE_WITHOUT_CUDA"
    BASE_IMAGE_BUILD="$BASE_IMAGE_BUILD_WITHOUT_CUDA"
elif [ "$1" = "--test" ]; then
    DOCKER_FILE="$SCRIPT_DIR/Dockerfile.test"
    VERSION="test"
else
    echo "error: please specify build type with --with-cuda or --without-cuda."
    exit 1
fi

docker build \
    --build-arg UID="$(id -u)" \
    --build-arg GID="$(id -g)" \
    --build-arg CUDA_ENABLED="$CUDA_ENABLED" \
    --build-arg BASE_IMAGE="$BASE_IMAGE" \
    --build-arg BASE_IMAGE_BUILD="$BASE_IMAGE_BUILD" \
    -t "$ORG/$NAME:$VERSION" \
    -f "$DOCKER_FILE" \
    "$SCRIPT_DIR"
