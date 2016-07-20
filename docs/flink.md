# Flink

## Example maven project

	mvn clean package -Pbuild-jar
	mvn exec:java -Dexec.mainClass=wikiedits.WikipediaAnalysis

## Start cluster

	sudo bin/start-local.sh

## Test

	nc -l -p 9000
	bin/flink run examples/streaming/SocketTextStreamWordCount.jar \
	  --hostname localhost \
	  --port 9000
	tail -f log/flink-*-jobmanager-*.out

## Dashboard

http://localhost:8081/#/overview


## Stop cluster

	bin/stop-local.sh

  