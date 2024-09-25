#!/usr/bin/env bash

# Get the directory of the script
ME461_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && cd .. && pwd)
echo "Using path: ${ME461_DIR}"

echo "clearing existing me461_labs instance"

docker stop me461_labs >/dev/null 2>&1 || true
docker rm me461_labs >/dev/null 2>&1 || true

echo "done with clearing"
echo "running the image"

# do we need --ipc=host in the run command below?
docker run -d \
	--privileged \
	--net=host \
	--pid=host \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ${ME461_DIR}:/home/me461/mnt/ \
	-v /dev:/dev \
	-e DISPLAY=${DISPLAY} \
	-u 1000 \
	-w /home/me461/mnt/labs_ws \
	--name me461_labs \
	--restart unless-stopped \
	me461_labs:latest \
	sleep infinity

echo "running convenience utils..."
#extra convenient stuff
docker exec me461_labs /bin/zsh ../util/init_env.sh

echo "enjoy the new instance by typing:"
echo "docker exec -it me461_labs /bin/zsh"
echo "or"
echo "docker exec -it me461_labs /bin/bash"
