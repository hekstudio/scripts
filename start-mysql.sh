#!/bin/bash

container_name=db_test
config_location=/root/docker/db_test/conf.d

# pull mysql image
docker pull mysql:latest

echo ${config_location}

# create a folder to save mysql config file
#mkdir -p ${config_location}

# copy config file
#cp ./conf.d/clickhouse-integration.cnf ${config_location}/clickhouse-integration.cnf

#--gtid-mode=ON \
#--enforce-gtid-consistency=ON \
#--default-authentication-plugin=mysql_native_password \
#-v ${PWD}/my.conf:/etc/mysql/conf.d/my.conf \

# run docker
docker run \
-d \
--restart=unless-stopped \
--name=${container_name} \
-v /storage/test-mysql/datadir:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-e MYSQL_DATABASE=${container_name} \
-v ${PWD}/conf.d:/etc/mysql/conf.d \
-p 13306:3306 \
mysql:latest \
--default-auth=mysql_native_password
#--default-auth=mysql_native_password
#--gtid-mode=on \
#--enforce-gtid_consistency=on
