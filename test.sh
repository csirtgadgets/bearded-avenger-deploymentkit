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
csirtg-smrt --runtime-path=/var/lib/cif -r /etc/cif/rules/default/csirtg.yml -f port-scanners -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball
csirtg-smrt --runtime-path=/var/lib/cif -r /etc/cif/rules/default/csirtg.yml -f uce-urls -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball
csirtg-smrt --runtime-path=/var/lib/cif -r /etc/cif/rules/default/openphish.yml -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball

echo 'waiting 30s... let hunter do their thing...'
sleep 30

cif --config /home/cif/.cif.yml --provider csirtg.io

cif --config /home/cif/.cif.yml --provider openphish.com

cif --config /home/cif/.cif.yml --itype ipv4 --feed --tags scanner

cif --config /home/cif/.cif.yml --itype fqdn --feed --tags search

cif --config /home/cif/.cif.yml --itype url --feed --tags uce

cif --config /home/cif/.cif.yml --itype url --feed --tags phishing

cif --config /home/cif/.cif.yml --itype ipv4 --feed --tags phishing --confidence 2

cif --config /home/cif/.cif.yml --itype ipv4 --confidence 2,6 --no-feed -d

echo
echo
echo "testing tokens"

cif-tokens --config /home/cif/.cif.yml
cif-tokens --config /home/cif/.cif.yml --user test-write --write --create
cif-tokens --config /home/cif/.cif.yml --user test-read --read --create
cif-tokens --config /home/cif/.cif.yml --user test-read-write --write --create --read
CIFSDK_CLIENT_HTTP_TRACE=1 cif-tokens -d --config /home/cif/.cif.yml

exit