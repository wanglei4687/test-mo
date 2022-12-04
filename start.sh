#!/bin/bash

docker pull matrixorigin/matrixone:0.6.0

export MO_PATH=$PWD

echo "> MOUNT PATH: $MO_PATH"
sudo docker run --name mo --privileged -d -p 6001:6001 \
     -v $MO_PATH/mo-data:/mo-data:rw \
     -v $MO_PATH/etc:/etc:rw \
     --entrypoint "/mo-service" \
     matrixorigin/matrixone:0.6.0 \
     -launch /etc/quickstart/launch.toml
