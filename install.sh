#!/bin/bash

docker build --no-cache --rm -t local/hadoop-base:2.9.2 base
docker build --no-cache --rm -t local/hadoop-master:2.9.2 master

