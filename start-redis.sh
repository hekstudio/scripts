#!/bin/bash

# var with default values
NAME="Redis" # redis docker name
HOST="Redis" # host name
PORT="6379"  # port
PASS="12345" # password

function help() {
    echo "
    Usage:
    -n NAME
    -h HOST
    -p PORT
    -w PASSWORD
    "
}

function parse_args() {
    while getopts ":h:p:w:n:" opt; do
        case $opt in
        n)
            NAME=${OPTARG}
            echo "NAME: ${NAME}"
            ;;
        h)
            HOST=${OPTARG}
            echo "HOST: ${HOST}"
            ;;
        p)
            PORT=${OPTARG}
            echo "PORT: ${PORT}"
            ;;
        w)
            PASS=${OPTARG}
            echo "PASS: ${PASS}"
            ;;
        ?)
            echo "unregistered argument"
            help
            exit
            ;;
        esac
    done
}

# get arguments
parse_args "$@"

# stop existing container if any
sudo docker stop ${NAME}

# remove existing container if any
sudo docker rm ${NAME}

# start redis docker
sudo docker run -d \
    -h redis \
    -e REDIS_PASSWORD=${PASS} \
    -v redis-data:/data \
    -p ${PORT}:6379 \
    --name ${NAME} \
    --restart always \
    redis:latest
