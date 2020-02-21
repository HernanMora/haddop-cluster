#!/bin/bash
rm /tmp/*.pid

/etc/configure.sh

service ssh start

echo 'Y' | bin/hdfs namenode -format

while true; do sleep 1000; done