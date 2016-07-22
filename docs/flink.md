# Flink

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

## Stop cluster

	sudo bin/stop-local.sh

## Example maven project

In the [streaming guide](https://ci.apache.org/projects/flink/flink-docs-release-1.0/apis/streaming/index.html) on the Flink website you can find an [example maven project](https://ci.apache.org/projects/flink/flink-docs-release-1.0/quickstart/run_example_quickstart.html)

	mvn archetype:generate\
	  -DarchetypeGroupId=org.apache.flink\
	  -DarchetypeArtifactId=flink-quickstart-java\
	  -DarchetypeVersion=1.0.0\
	  -DgroupId=wiki-edits\
	  -DartifactId=wiki-edits\
	  -Dversion=0.1\
	  -Dpackage=wikiedits\
	  -DinteractiveMode=false
	mvn clean package -Pbuild-jar
	mvn exec:java -Dexec.mainClass=wikiedits.WikipediaAnalysis

## Troubleshooting

- `NoResourceAvailableException: Not enough free slots available to run the job.`
  To avoid this error, increase the `taskmanager.numberOfTaskSlots` configuration option, or cancel a previously run job using the web interface. Cancelling a job using `ctrl-C` on the command line is not enough to free up the slot.

  