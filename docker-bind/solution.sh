#!/bin/bash

# download nginx confiration
sudo curl https://github.com/alem-io/track-devops/blob/master/subjects/docker/docker-bind/nginx.conf -o "$(pwd)"/nginx.conf

# running nginx container
sudo docker run -d \
  --name jusan-docker-bind \
  --mount type=bind,source="$(pwd)"/nginx.conf,target=/etc/nginx/nginx.conf \
  -p 7777:80 nginx:mainline

