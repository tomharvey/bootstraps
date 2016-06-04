#!/bin/bash

####  Setup:
    # You must create an S3 Bucket named ORG_NAME-chef-setup
    # where ORG-NAME is the name of your chef organisation
    # Into this bucket, add your validation files and a client.rb file

####  Usage: pass the organisation name as the first and only argument to the script

#### See the wiki page at https://github.com/tomharvey/bootstraps/wiki/configure-chef-client for more

echo "Configuring chef for organistaion $1"

# Install chef-client from deb package
curl -L -o /tmp/chef_12.10.24-1_amd64.deb https://packages.chef.io/stable/ubuntu/10.04/chef_12.10.24-1_amd64.deb
dpkg -i /tmp/chef_12.10.24-1_amd64.deb

# Configure chef for the organisation passed as arg 1 in the script
s3cmd get s3://$1-chef-setup/pkore-validator.pem /etc/chef/$1-validation.pem
s3cmd get s3://$1-chef-setup/client.rb /etc/chef/client.rb

# Perform a first run of chef-client
/usr/bin/chef-client

# Add a system cron job to run chef-client every 15mins
echo '*/15 * * * * root /usr/bin/chef-client' >> /etc/crontab
