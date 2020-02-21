#!/bin/bash
rm /tmp/*.pid

/etc/configure.sh

service ssh start

if [ ! -f "/data/namenode/current/VERSION" ]; then
  echo 'Y' | bin/hdfs namenode -format -clusterID CID-$CLUSTER_NAME
fi

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh 

while true; do sleep 1000; done