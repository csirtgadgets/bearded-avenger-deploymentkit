#!/bin/bash

sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

set -e

yum -y update

echo 'updating apt-get tree and installing python-pip'
sudo yum install -y gcc python-pip python-devel git libffi-devel openssl-devel

echo 'installing ansible...'
sudo pip install 'setuptools>=18.3,<40.0' 'ansible>=2.2.1.0'

echo 'running ansible...'
ansible-playbook -i "localhost," -c local site.yml -vv

bash ../test.sh