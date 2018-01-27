FROM ubuntu:artful
LABEL maintainer="tank@jundy.com"

RUN apt-get update; apt-get -y install wget scala;

RUN wget -q http://www.gtlib.gatech.edu/pub/apache/kafka/1.0.0/kafka_2.11-1.0.0.tgz
RUN tar -zxf kafka_2.11-1.0.0.tgz
RUN ln -s /kafka_2.11-1.0.0 /kafka

CMD /kafka/bin/zookeeper-server-start.sh /kafka/config/zookeeper.properties

# docker build --rm=false -t zookeeper .
# docker run -d --rm --name my_zookeeper zookeeper
#     port: 2181