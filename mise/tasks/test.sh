#!/bin/bash
#MISE description="Test the project using Swift Package Manager"
#USAGE flag "-l --linux" help="Virtualize in a Linux container"
set -euo pipefail

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
        "swift test --build-path ./.build/linux"
else
    swift test
fi
