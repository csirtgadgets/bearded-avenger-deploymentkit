#!/bin/bash

set -e

export CIF_ELASTICSEARCH=$CIF_ELASTICSEARCH

echo 'installing the basics'
sudo apt-get update && apt-get install -y build-essential python-dev python2.7 python-pip python-dev aptitude \
    python-pip libffi-dev libssl-dev sqlite3 software-properties-common

echo 'installing ansible...'
sudo -H pip install 'setuptools>=11.3,<34.0' 'ansible==2.2.1.0'

echo 'running ansible...'
ansible-playbook -i "localhost," -c local site.yml -vv

bash ../test.sh