#!/bin/bash

set -e

echo 'installing ansible...'
sudo pip install 'setuptools>=18.3,<34.0' 'ansible>=2.4,<2.5'

echo 'installing roles'
ansible-galaxy install elastic.elasticsearch,5.5.1

# test to see if we've linked this in development
# install by default in production
if [ ! -e roles/csirtgadgets.cif ] && [ ! -e ../roles/csirtgadgets.cif ]; then
  ansible-galaxy install csirtgadgets.cif,0.0.4
fi

echo 'running ansible...'
ansible-playbook -i "localhost," -c local site.yml -vv
