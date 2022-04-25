#!/bin/bash

container_name=db_test

docker stop ${container_name}
docker rm ${container_name}