#!/bin/bash

# pull mysql image
docker pull mysql:latest

# run docker
docker run \
-d \
--name=db_test \
-v /storage/test-mysql/datadir:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-e MYSQL_DATABASE=db_test \
-p 13306:3306 \
mysql:latest
