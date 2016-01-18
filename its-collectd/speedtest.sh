#!/bin/sh

HOSTNAME="${COLLECTD_HOSTNAME:-localhost}"
INTERVAL="${COLLECTD_INTERVAL:-300}"

tail -f -n0 /home/speedtest/collectd.log | sed 's/HOSTNAME/'"$HOSTNAME"'/'
