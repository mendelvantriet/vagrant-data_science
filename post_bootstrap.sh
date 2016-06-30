# source me

SPARK_VERSION=1.5.2
SHELL_RC=~/.zshrc

function addToPath {
	export PATH="$1:$PATH"
	echo export PATH="$PATH" >> $SHELL_RC
}

# spark
if [[ ! -f "/vagrant/spark-$SPARK_VERSION-bin-hadoop2.6.tgz" ]]; then
	sudo wget http://apache.cs.uu.nl/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.6.tgz -P /vagrant
fi
if [[ -f "/vagrant/spark-$SPARK_VERSION-bin-hadoop2.6.tgz" ]]; then
	tar -xzf /vagrant/spark-$SPARK_VERSION-bin-hadoop2.6.tgz -C ~/applications/
	ln -s spark-$SPARK_VERSION-bin-hadoop2.6 ~/applications/spark
	printf 'export SPARK_HOME=$HOME/applications/spark\n' >> $SHELL_RC
	addToPath $HOME/applications/spark/bin
	echo "alias pyspark-notebook='PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark --master local[*]'\n" | \
	tee -a $SHELL_RC
else
	echo "[WARNING] Spark not installed"
fi

echo "Done"

