#!/bin/bash
# reference: https://hub.docker.com/r/clickhouse/clickhouse-server/

docker run \
-d \
--restart=unless-stopped \
--name clickhouse-server-test \
--ulimit nofile=262144:262144 \
clickhouse/clickhouse-server