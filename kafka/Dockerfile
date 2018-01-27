FROM ubuntu:artful
LABEL maintainer="tank@jundy.com"

RUN apt-get update; apt-get -y install wget scala;

RUN wget -q http://www.gtlib.gatech.edu/pub/apache/kafka/1.0.0/kafka_2.11-1.0.0.tgz
RUN tar -zxf kafka_2.11-1.0.0.tgz
RUN ln -s /kafka_2.11-1.0.0 /kafka

CMD /kafka/bin/kafka-server-start.sh /kafka/config/server.properties

# docker build --rm=false -t kafka_server .
# docker run -d --rm --name my_kafka_server kafka_server