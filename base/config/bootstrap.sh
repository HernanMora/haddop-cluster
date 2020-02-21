#!/bin/bash
rm /tmp/*.pid

/etc/configure.sh

service ssh start

while true; do sleep 1000; done