#!/bin/bash -xe

# Installs the latest CloudFormation tools

apt-get update
apt-get install -y python-pip python-yaml unattended-upgrades
pip install pystache
pip install python-daemon

cd /usr/local/src/
wget 'https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz'
tar -xvpf aws-cfn-bootstrap-latest.tar.gz
cd aws-cfn-bootstrap-1.4/
python setup.py build
python setup.py install

cd /etc/init.d/
ln -s /usr/local/src/aws-cfn-bootstrap-1.4/init/ubuntu/cfn-hup .
chmod u+x cfn-hup

/usr/sbin/update-rc.d cfn-hup enable
