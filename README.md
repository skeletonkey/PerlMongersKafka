# PerlMongersKafka
Code base for Kafka demonstration for February 2018's Perl Mongers group

## Setup/Requirements
### Software
The following software is required:
* [Docker](https://www.docker.com/community-edition)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Environment
It is *assumed* that the following instructions are run in a bash (or comparable) shell.

The following **Environmental Variable** needs to be set up:
* `PMP_BASE_DIR` - set to the directory where this repo has been cloned to:
```export PMP_BASE_DIR=/home/PerlMongersKafka```



## Kafka Cluster
### Start
To start the Kafka cluster run the following in the base directory:
```
docker-compose up
```

### Test
To test that the cluster is running properly:
1. connect to Kafka container:
  * ```docker exec -it perlmongerskafka_kafka_1 /bin/bash```
2. make sure that the topic `weather` exists:
  * ```/kafka/bin/kafka-topics.sh --list --zookeeper perlmongerskafka_zookeeper_1:2181```
3. send some data to Kafka's weather topic - aka: start a producer:
  * ```/kafka/bin/kafka-console-producer.sh --broker-list perlmongerskafka_kafka_1:9092 --topic weather```
4. read data from Kafka's weather topic - aka: start a consumer:
  * ```/kafka/bin/kafka-console-consumer.sh --bootstrap-server perlmongerskafka_kafka_1:9092 --topic weather --from-beginning```
  
# Resources:
* [Apache Kafka's Quickstart](https://kafka.apache.org/quickstart)
