#!/bin/bash

set -e

echo 'installing ansible...'
sudo pip install 'setuptools>=18.3,<34.0' 'ansible>=2.3,<2.4'

echo 'running ansible...'
ansible-playbook -i "localhost," -c local site.yml -vv