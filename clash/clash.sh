#!/bin/bash

config_file=${1-:"$PWD/config.yaml"}

docker run -itd --name clash -v $config_file:/root/.config/clash/config.yaml -p 7890:7890 -p 7891:7891 -p 9090:9090 --restart=always dreamacro/clash
docker run -p 1234:80 -d --restart=always --name yacd haishanh/yacd
