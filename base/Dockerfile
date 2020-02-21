FROM ubuntu:16.04

USER root

# Install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y openssh-server openjdk-8-jdk wget

ENV HADOOP_VERSION 2.9.1

# Set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV PATH $PATH:$JAVA_HOME/bin

ENV HADOOP_HOME /usr/local/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Install hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz ; \
    tar -xzvf hadoop-$HADOOP_VERSION.tar.gz ; \
    mv hadoop-$HADOOP_VERSION $HADOOP_HOME ; \
    rm hadoop-$HADOOP_VERSION.tar.gz

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' ; \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ADD config/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

RUN mkdir -p ~/hdfs/namenode; \ 
    mkdir -p ~/hdfs/datanode; \
    mkdir $HADOOP_HOME/logs

ADD etc/* $HADOOP_HOME/etc/hadoop/

#ADD config/ssh_config /root/.ssh/config
ADD config/bootstrap.sh /etc/bootstrap.sh
ADD config/configure.sh /etc/configure.sh

RUN chown root:root /etc/bootstrap.sh /etc/configure.sh ; \
    chmod 700 /etc/bootstrap.sh ; \
    chmod 700 /etc/configure.sh    
    
RUN chmod +x $HADOOP_HOME/sbin/start-dfs.sh ; \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

EXPOSE 8088 50070

WORKDIR $HADOOP_HOME

# Format namenode
RUN bin/hdfs namenode -format

CMD ["/etc/bootstrap.sh"]