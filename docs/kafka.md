# Kafka

## Start

	cd /opt/kafka/

## Start Zookeeper

	sudo bin/zookeeper-server-start.sh config/zookeeper.properties

## Start Kafka

	su kafka
	bin/kafka-server-start.sh config/server.properties

## Test command line

Create a topic called 'test'

	bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
	bin/kafka-topics.sh --list --zookeeper localhost:2181

### Producer

	bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

### Consumer

	bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning

## Test file

	echo -e "foo\nbar" > test.txt
	bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-source.properties config/connect-file-sink.properties
	cat test.sink.txt

