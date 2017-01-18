# CIFv3 DeploymentKit

```bash
$ git clone https://github.com/csirtgadgets/bearded-avenger-deploymentkit.git
$ cd bearded-avenger-deploymentkit
$ sudo bash easybutton.sh
$ sudo service csirtg-smrt stop
$ sudo su - cif
$ csirtg-smrt --client cif --fireball -r /etc/cif/rules/default/csirtg.yml -f port-scanners -d
$ cif --itype ipv4
$ cif-tokens
$ sudo service csirtg-smrt start
```