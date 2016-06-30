# vagrant-data_science

Virtualbox, Ansible, Debian based

## Contains

* python 2.7 virtual env
* python 3.4 virtual env
* jupyther notebook
* java 8, eclipse, maven
* scala, eclipse, sbt
* r and r-studio
* spark

## Usage

* Edit some variables like basebox and spark-version
* Get the private_key file from your base box
* vagrant up
* Log in as your preferred user
* Optionally run bootstrap-hdd.sh

## Troubleshooting

- Run playbook manually

	vagrant provision

or

	ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant site.yml

## TODO

More ansible

## Disclaimer

It works on my machine :P
