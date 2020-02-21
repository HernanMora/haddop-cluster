#!/bin/bash

sed -i "s|HADOOP_MASTER|$HADOOP_MASTER|" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i "s|HADOOP_MASTER|$HADOOP_MASTER|" $HADOOP_HOME/etc/hadoop/yarn-site.xml


SLAVES_CONFIG="$HADOOP_HOME/etc/hadoop/slaves"
rm $SLAVES_CONFIG
if [ ! -z "$SLAVES" ]; then
    echo $SLAVES | tr , '\n' > $SLAVES_CONFIG
fi