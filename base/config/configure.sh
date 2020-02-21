#!/bin/bash

sed -i "s|HADOOP_MASTER|$HADOOP_MASTER|" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s|HADOOP_MASTER|$HADOOP_MASTER|" $HADOOP_HOME/etc/hadoop/yarn-site.xml

rm $HADOOP_HOME/etc/hadoop/slaves
IFS=',' read -ra NODES <<< "$SLAVES"
for NODE in "${NODES[@]}"; do
    echo "$NODE" >> $HADOOP_HOME/etc/hadoop/slaves
done