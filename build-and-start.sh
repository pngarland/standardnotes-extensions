#!/bin/sh

containerName=sn-extensions
docker rm --force $containerName
docker build -t $containerName .

docker run -d --name sn-extensions --restart always \
  -p 8222:80 \
  $containerName

