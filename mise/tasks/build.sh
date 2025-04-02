#!/bin/bash
#MISE description="Build the project using Swift Package Manager"
#USAGE flag "-l --linux" help="Virtualize in a Linux container"
set -eo pipefail

if command -v podman &> /dev/null
then
    container_tool="podman"
elif command -v docker &> /dev/null
then
    container_tool="docker"
fi

if [ "$usage_linux" = "true" ]; then
    $container_tool run --rm \
        --volume "$MISE_PROJECT_ROOT:/package" \
        --workdir "/package" \
        swift:6.0.0 \
        /bin/bash -c \
        "swift build --configuration release --build-path ./.build/linux"
else
    swift build --configuration release
fi
