#!/bin/bash

set -e

echo 'giving things a chance to settle...'
sleep 10

echo 'testing connectivity'
sudo -u cif cif --config /home/cif/.cif.yml -p

echo 'testing query'
sudo -u cif cif --config /home/cif/.cif.yml --search example.com

echo 'waiting...'
sleep 5

echo 'testing query'
sudo -u cif cif --config /home/cif/.cif.yml --search example.com

echo 'waiting...'
sleep 5

sudo -u cif cif --config /home/cif/.cif.yml --itype ipv4 --tags saerch

sudo -u cif cif --config /home/cif/.cif.yml -q 93.184.216.34

echo 'waiting...'
sleep 5

sudo -u cif cif --config /home/cif/.cif.yml -q 93.184.216.34

sudo su - cif
csirtg-smrt --runtime-path=/var/lib/cif -r /etc/cif/rules/default/csirtg.yml -f port-scanners -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid
csirtg-smrt --runtime-path=/var/lib/cif -r /etc/cif/rules/default/csirtg.yml -f uce-urls -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid
csirtg-smrt --runtime-path=/var/lib/cif -r /etc/cif/rules/default/openphish.yml -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid

echo 'waiting 15s... let hunter do their thing...'
sleep 15

cif --config /home/cif/.cif.yml --provider csirtg.io

cif --config /home/cif/.cif.yml --provider openphish.com

cif --config /home/cif/.cif.yml --itype ipv4 --feed --tags scanner

cif --config /home/cif/.cif.yml --itype fqdn --feed --tags search

cif --config /home/cif/.cif.yml --itype url --feed --tags uce

cif --config /home/cif/.cif.yml --itype url --feed --tags phishing

cif --config /home/cif/.cif.yml --itype ipv4 --feed --tags phishing --confidence 2
exit