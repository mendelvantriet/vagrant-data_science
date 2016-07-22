# Flink

## Example maven project

	mvn clean package -Pbuild-jar
	mvn exec:java -Dexec.mainClass=wikiedits.WikipediaAnalysis

## Start cluster

	sudo bin/start-local.sh

## Test

	nc -l -p 9000
	sudo bin/flink run examples/streaming/SocketTextStreamWordCount.jar \
	  --hostname localhost \
	  --port 9000
	tail -f log/flink-*-jobmanager-*.out

## Dashboard

http://localhost:8081/#/overview

## Troubleshooting

- NoResourceAvailableException: Not enough free slots available to run the job.
  To avoid this error, increase the taskmanager.numberOfTaskSlots configuration option, or cancel a previously run job using the web interface. Cancelling a job using ctrl-C on the command line is not enough to free up the slot.

## Stop cluster

	sudo bin/stop-local.sh

  