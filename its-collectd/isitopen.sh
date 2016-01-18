#!/bin/sh

HOSTNAME="${COLLECTD_HOSTNAME:-localhost}"
INTERVAL="${COLLECTD_INTERVAL:-60}"

while sleep $INTERVAL; do
    v=$(curl -s http://it-syndikat.org/status.txt | awk -vFS=, '{ print $1 }')
    if [ x"$v" = x"true" ]; then
        VALUE=1
    else
        VALUE=0
    fi


    echo "PUTVAL \"$HOSTNAME/exec-isitopen/gauge-isitopen\" interval=$INTERVAL N:$VALUE"
done
