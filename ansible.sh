#!/bin/bash

set -e

echo 'installing ansible...'
sudo pip install 'setuptools>=18.3,<34.0' 'ansible>=2.4,<2.5'

echo 'installing roles'
ansible-galaxy install -r requirements.yml --ignore-errors

echo 'running ansible...'
ansible-playbook -i "localhost," -c local site.yml -vv