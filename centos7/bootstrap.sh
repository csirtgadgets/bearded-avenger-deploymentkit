#!/bin/bash

export CIF_ELASTICSEARCH=$CIF_ELASTICSEARCH
export CIF_ANSIBLE_SDIST=$CIF_ANSIBLE_SDIST
export CIF_HUNTER_THREADS=$CIF_HUNTER_THREADS
export CIF_GATHERER_GEO_FQDN=$CIF_GATHERER_GEO_FQDN
export CIF_HUNTER_ADVANCED=$CIF_HUNTER_ADVANCED
export RHEL=$RHEL

if [ "${RHEL}" == '1' ]; then
    subscription-manager repos --enable rhel-7-server-extras-rpms
else
    yum -y install epel-release
    rm -fr /var/cache/yum/*
    yum clean all
fi

# do this after, just in case EPEL is already built in and fails
set -e

yum -y update

echo 'updating apt-get tree and installing python-pip'
sudo yum install -y gcc python-pip python-devel git libffi-devel openssl-devel

bash ../ansible.sh

if [[ "$CIF_BOOTSTRAP_TEST" -eq '1' ]]; then
    bash ../test.sh
fi