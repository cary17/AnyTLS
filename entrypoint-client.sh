#!/bin/sh
set -e

trap 'kill -TERM $child 2>/dev/null; wait $child 2>/dev/null' TERM INT

if [ -n "$SERVER_URI" ]; then
    /usr/local/bin/anytls-client -l "$LISTEN_ADDR" -s "$SERVER_URI" &
elif [ -n "$SERVER_ADDR" ] && [ -n "$PASSWORD" ]; then
    /usr/local/bin/anytls-client -l "$LISTEN_ADDR" -s "$SERVER_ADDR" -p "$PASSWORD" &
else
    echo "Error: Either SERVER_URI or both SERVER_ADDR and PASSWORD must be set"
    exit 1
fi

child=$!
wait $child
