#!/bin/bash

set -e

#echo 'adding ubuntu to cif group...'
#sudo usermod -aG cif ubuntu

. /etc/default/cif
. /etc/default/smrt


echo 'giving things a chance to settle...'
sleep 10

echo 'testing connectivity'
curl -v -k https://localhost
sudo -E -u cif cif --config /home/cif/.cif.yml -p

echo 'testing query'
sudo -E -u cif cif --config /home/cif/.cif.yml --search example.com

echo 'waiting...'
sleep 5

echo 'testing query'
sudo -E -u cif cif --config /home/cif/.cif.yml --search example.com

echo 'waiting...'
sleep 5

sudo -E -u cif cif --config /home/cif/.cif.yml --itype ipv4 --tags saerch

sudo -E -u cif cif --config /home/cif/.cif.yml -q 93.184.216.34

echo 'waiting...'
sleep 5

sudo -E -u cif cif --config /home/cif/.cif.yml -q 93.184.216.34

sudo -E -u cif CSIRTG_SMRT_RUNTIME_PATH=/var/lib/smrt CSIRTG_SMRT_CACHE_PATH=/var/lib/smrt csirtg-smrt -r /etc/cif/rules/default/openphish.yml -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball --goback 7
sudo -E -u cif CSIRTG_SMRT_RUNTIME_PATH=/var/lib/smrt CSIRTG_SMRT_CACHE_PATH=/var/lib/smrt csirtg-smrt -r /etc/cif/rules/default/openphish.yml -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball --goback 7
sudo -E -u cif CSIRTG_TOKEN="" CSIRTG_SMRT_RUNTIME_PATH=/var/lib/smrt CSIRTG_SMRT_CACHE_PATH=/var/lib/smrt csirtg-smrt -r /etc/cif/rules/default/csirtg.yml -f port-scanners -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball --goback 7
sudo -E -u cif CSIRTG_TOKEN="" CSIRTG_SMRT_RUNTIME_PATH=/var/lib/smrt CSIRTG_SMRT_CACHE_PATH=/var/lib/smrt csirtg-smrt -r /etc/cif/rules/default/csirtg.yml -f uce-urls -d --remember --client cif --config /etc/cif/csirtg-smrt.yml --limit 100 --skip-invalid --fireball --goback 7

echo 'waiting 30s... let hunter do their thing...'
sleep 30

sudo -E -u cif cif --config /home/cif/.cif.yml --provider csirtg.io

sudo -E -u cif cif --config /home/cif/.cif.yml --provider openphish.com

sudo -E -u cif cif --config /home/cif/.cif.yml --itype ipv4 --feed --tags scanner

sudo -E -u cif cif --config /home/cif/.cif.yml --itype fqdn --feed --tags search

sudo -E -u cif cif --config /home/cif/.cif.yml --itype url --feed --tags uce

sudo -E -u cif cif --config /home/cif/.cif.yml --itype url --feed --tags phishing

sudo -E -u cif cif --config /home/cif/.cif.yml --itype ipv4 --feed --tags phishing --confidence 2

sudo -E -u cif cif --config /home/cif/.cif.yml --itype ipv4 --confidence 1,6 --no-feed -d

sudo -E -u cif cif --config /home/cif/.cif.yml --itype fqdn --confidence 1,6 --no-feed -d

echo
echo
echo "testing tokens"

sudo -E -u cif cif-tokens --config /home/cif/.cif.yml
sudo -E -u cif cif-tokens --config /home/cif/.cif.yml --user test-write --write --create
sudo -E -u cif cif-tokens --config /home/cif/.cif.yml --user test-read --read --create
sudo -E -u cif cif-tokens --config /home/cif/.cif.yml --user test-read-write --write --create --read
sudo -E -u cif CIFSDK_CLIENT_HTTP_TRACE=1 cif-tokens -d --config /home/cif/.cif.yml