#!/bin/bash

# Installs the latest code-deploy agent in eu-west-1 region
# from http://docs.aws.amazon.com/de_de/codedeploy/latest/userguide/how-to-run-agent.html#how-to-run-agent-install-ubuntu

sudo apt-get update
sudo apt-get install -y python-pip ruby2.0
sudo pip install awscli

cd /usr/local/src/
sudo aws s3 cp s3://aws-codedeploy-eu-west-1/latest/install . --region eu-west-1
sudo chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start

# Check the version
sudo dpkg -s codedeploy-agent
