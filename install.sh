#!/bin/bash

docker build --rm -t local/hadoop-base:2.9.1 base
docker build --rm -t local/hadoop-master:2.9.1 master

#docker login registry.devpos.neosecure.com.ar -u admin -p 'Apple2000!'

#docker tag local/hadoop-base:2.9.1 registry.devpos.neosecure.com.ar/local/hadoop-base:2.9.1
#docker push registry.devpos.neosecure.com.ar/local/hadoop-base:2.9.1

#docker tag local/hadoop-master:2.9.1 registry.devpos.neosecure.com.ar/local/hadoop-master:2.9.1
#docker push registry.devpos.neosecure.com.ar/local/hadoop-master:2.9.1
