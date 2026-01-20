#!/bin/sh
set -e

trap 'kill -TERM $child 2>/dev/null; wait $child 2>/dev/null' TERM INT

if [ -z "$PASSWORD" ]; then
    echo "Error: PASSWORD environment variable is required"
    exit 1
fi

/usr/local/bin/anytls-server -l "$LISTEN_ADDR" -p "$PASSWORD" &
child=$!
wait $child
