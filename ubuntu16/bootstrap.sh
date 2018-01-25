#!/bin/bash

set -e

export CIF_ANSIBLE_ES=$CIF_ANSIBLE_ES
export CIF_ANSIBLE_SDIST=$CIF_ANSIBLE_SDIST
export CIF_HUNTER_THREADS=$CIF_HUNTER_THREADS
export CIF_HUNTER_ADVANCED=$CIF_HUNTER_ADVANCED
export CIF_GATHERER_GEO_FQDN=$CIF_GATHERER_GEO_FQDN

echo 'installing the basics'
sudo apt-get update && apt-get install -y build-essential python-dev python2.7 python-pip python-dev aptitude \
    python-pip libffi-dev libssl-dev sqlite3 software-properties-common

echo 'checking for python-openssl'
set +e
EXISTS=$( dpkg -l | grep python-openssl )
set -e
if [[ ! -z ${EXISTS} ]]; then
	echo "Python-openssl found. Applying workaround"
	echo "#@link https://github.com/csirtgadgets/bearded-avenger-deploymentkit/issues/15"
	echo "# sudo apt-get --auto-remove --yes remove python-openssl"
	echo "# sudo pip install pyOpenSSL"
	sudo apt-get --auto-remove --yes remove python-openssl && sudo pip install pyOpenSSL
fi

bash ../ansible.sh

if [[ "$CIF_BOOTSTRAP_TEST" -eq '1' ]]; then
    bash ../test.sh
fi
