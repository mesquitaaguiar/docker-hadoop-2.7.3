FROM ubuntu:14.04

# install java
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jdk && \
    rm -rf /var/lib/apt/lists/*

# Hadoop
ENV HADOOP_VERSION 2.7.3
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_OPTS -Djava.library.path=/usr/local/hadoop/lib/native
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget libzip2 libsnappy1 libssl-dev && \
    wget http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    tar -zxf /hadoop-$HADOOP_VERSION.tar.gz && \
    rm /hadoop-$HADOOP_VERSION.tar.gz && \
    mv hadoop-$HADOOP_VERSION /usr/local/hadoop && \
    mkdir -p /usr/local/hadoop/logs
