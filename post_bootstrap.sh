# source me

SCALA_VERSION=2.10.3
SPARK_VERSION=1.5.2
MAVEN_VERSION=3.3.3
SBT_VERSION=0.13
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

# maven
if [[ -f "/vagrant/apache-maven-$MAVEN_VERSION-bin.tar.gz" ]]; then
	echo "[INFO] Installing Maven..."
	tar -xzf /vagrant/apache-maven-$MAVEN_VERSION-bin.tar.gz -C ~/applications/
	ln -s apache-maven-$MAVEN_VERSION ~/applications/maven
	ln -s ../applications/maven/bin/mvn ~/bin/mvn
	#cp /vagrant/setings.xml ~/.m2
else
	echo "[WARNING] Maven not installed"
fi

# eclipse
if [[ -f "/vagrant/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz" ]]; then
	echo "[INFO] Installing Eclipse..."
	tar -xzf /vagrant/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz -C ~/applications/
	ln -s ../applications/eclipse/eclipse ~/bin/eclipse
#	~/bin/eclipse \
#		-application org.eclipse.equinox.p2.director \
#		-repository http://download.eclipse.org/egit/updates/ \
#		-installIU org.eclipse.egit \
#		-destination ~/applications/eclipse/
else
	echo "[WARNING] Eclipse not installed"
fi


echo "Done"

