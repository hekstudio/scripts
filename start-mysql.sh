#!/bin/bash

# pull mysql image
docker pull mysql:latest

# run docker
docker run \
-d \
--name=db1 \
-v /storage/test-mysql/datadir:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=23235 \
-e MYSQL_DATABASE=db1 \
-p 13306:3306 \
mysql:latest
