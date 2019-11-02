#!/bin/bash

case $1 in
    config)
    echo "graph_category network"
    echo "graph_title Connection Speed"
    echo "graph_args --base 1000 -l 0"
    echo "graph_vlabel DL / UL / PING"
    echo "graph_scale no"
    echo "down.label DL"
    echo "down.type GAUGE"
    echo "down.draw LINE1"
    echo "up.label UL"
    echo "up.type GAUGE"
    echo "up.draw LINE1"
    echo "lat.label PING"
    echo "lat.type GAUGE"
    echo "lat.draw LINE1"
    echo "graph_info Graph of Internet Connection Speed"
    exit 0;;
    esac

OUTPUT=`cat /tmp/speedtest.out`
DOWNLOAD=`echo "$OUTPUT" | grep Download | sed 's/[a-zA-Z:]* \([0-9]*\.[0-9]*\) [a-zA-Z/]*/\1/'`
UPLOAD=`echo "$OUTPUT" | grep Upload | sed 's/[a-zA-Z:]* \([0-9]*\.[0-9]*\) [a-zA-Z/]*/\1/'`
LATENCY=`echo "$OUTPUT" | grep ms$ |cut -d':' -f2|sed 's/[a-zA-Z:]* \([0-9]*\.[0-9]*\) [a-zA-Z/]*/\1/'`

echo "down.value $DOWNLOAD"
echo "up.value $UPLOAD"
echo "lat.value $LATENCY"
exit 0
