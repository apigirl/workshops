#!/bin/bash

#####################
# Installing docker #
#####################

echo "Creating the workshop folder..." | wall -n

mkdir /log-workshop

git clone https://github.com/l0k0ms/distributed-tracing-with-apm-workshop.git /log-workshop

cd /log-workshop/

git checkout log-workshop-2

echo "Workshop folder created !" | wall -n

touch ~/.bashrc

echo "export POSTGRES_USER=postgres" >> ~/.bashrc

echo "export POSTGRES_PASSWORD=" >> ~/.bashrc

echo "alias add_labels='mv ./conf.d/docker-compose_with_labels.yml ./docker-compose.yml'">> ~/.bashrc

echo "alias application_build='POSTGRES_USER=\$POSTGRES_USER POSTGRES_PASSWORD=\$POSTGRES_PASSWORD DD_API_KEY=\$DD_API_KEY docker-compose up --build -d'">> ~/.bashrc

echo "alias application_up='POSTGRES_USER=\$POSTGRES_USER POSTGRES_PASSWORD=\$POSTGRES_PASSWORD DD_API_KEY=\$DD_API_KEY docker-compose up --build -d'">> ~/.bashrc

echo "alias application_stop='docker-compose stop && docker-compose rm -f'">> ~/.bashrc

echo "alias application_reload='application_stop && application_up'">> ~/.bashrc

echo "alias new_step='source ~/.bashrc && cd ~/log-workshop"

echo "Configuration is now over, press enter in the terminal" | wall -n