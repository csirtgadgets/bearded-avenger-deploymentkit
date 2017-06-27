#!/bin/bash

export CIF_ELASTICSEARCH=$CIF_ELASTICSEARCH
export CIF_ANSIBLE_SDIST=$CIF_ANSIBLE_SDIST
export CIF_HUNTER_THREADS=$CIF_HUNTER_THREADS
export CIF_GATHERER_GEO_FQDN=$CIF_GATHERER_GEO_FQDN
export CIF_HUNTER_ADVANCED=$CIF_HUNTER_ADVANCED

set -e

yum -y install epel-release
yum -y update

echo 'updating apt-get tree and installing python-pip'
sudo yum install -y gcc python-pip python-devel git libffi-devel openssl-devel

bash ../ansible.sh

if [[ "$CIF_BOOTSTRAP_TEST" -eq '1' ]]; then
    bash ../test.sh
fi