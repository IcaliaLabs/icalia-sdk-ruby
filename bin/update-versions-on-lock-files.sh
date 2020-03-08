#! /bin/sh

# This script assumes your'e running docker-compose
set -e

docker-compose run --rm event_notification bundle
docker-compose run --rm event_webhook bundle
docker-compose run --rm core bundle
docker-compose run --rm event_meta bundle
docker-compose run --rm sdk_meta bundle
