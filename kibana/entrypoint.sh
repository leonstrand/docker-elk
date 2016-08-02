#!/usr/bin/env bash

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "$0: Waiting for connection to docker container elasticsearchloadbalancer:9200"
while true; do
    nc -q 1 elasticsearchloadbalancer 9200 2>/dev/null && break
done
echo "$0: Connected to docker container elasticsearchloadbalancer:9200"
echo "$0: Starting Kibana"
exec kibana
