#!/usr/bin/env bash

# java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | \
  sudo tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | \
  sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
sudo apt-get install -y oracle-java8-installer


# python
sudo apt-get install -y python3-pip python3-numpy python3-scipy python3-pandas
sudo pip3 install virtualenv

# R
sudo apt-get install -y r-base

# RStudio
if [[ -f "/vagrant/rstudio-0.99.491-amd64.deb" ]]; then
	echo "[INFO] Installing RStudio..."
	sudo dpkg -i /vagrant/rstudio-0.99.491-amd64.deb
else
	echo "[WARNING] RStudio not installed"
fi

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install -y sbt

sudo updatedb

echo "Done"

