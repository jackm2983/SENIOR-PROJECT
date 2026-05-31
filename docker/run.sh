#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

xhost +local:docker > /dev/null 2>&1

docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -e HOME=/home/ubuntu \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "$REPO_ROOT/ADC/4bit_C2C/MagicAndSpice":/home/ubuntu/workspace/MagicAndSpice \
  -v "$REPO_ROOT/ASIC":/home/ubuntu/workspace/ASIC \
  --hostname senior-project \
  -w /home/ubuntu/workspace \
  --entrypoint /bin/bash \
  senior-project-toolchain \
  -c 'chmod 666 /home/ubuntu/workspace/MagicAndSpice/*.mag && exec bash'
