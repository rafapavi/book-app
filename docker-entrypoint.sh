#!/bin/bash

set -eo pipefail

if [ ! -f /var/lib/mysql/initialized ]; then
    /usr/local/bin/docker-entrypoint.sh "$@"
    touch /var/lib/mysql/initialized
else
    echo "Initialization already done, skipping..."
    exec "$@"
fi
