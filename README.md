# Getting Started

**DO NOT TRY TO INSTALL via `python setup.py install`, CIF has many moving parts, the DeploymentKit will take care of the heavy lifting (with the help of Ansible).**

Welcome to the Bearded-Avenger Deployment Kit! This Kit will help you get CIFv3 up and running using the latest stable [release](https://github.com/csirtgadgets/bearded-avenger/releases) using a combination of bash and ansible. 

[Ubuntu 16 LTS](Ubuntu16LTS) is the operating system in which CIFv3 is developed against and is the most commonly used. [RHEL/CentOS](CentOS72) are the second most common platforms used by the community, but lags in community support. If you run into a problem, be sure to first checkout:

 * [Known Issues](https://github.com/csirtgadgets/bearded-avenger/issues?labels=bug&state=open)  
 * [FAQ](FAQ)
 * [Mailing List](https://groups.google.com/forum/#!forum/ci-framework)  

and as always, contributions [welcome!](https://github.com/csirtgadgets/bearded-avenger/issues/new).

# the EasyButton (... because we all hate to read)
In most cases; the default SQLite install should take 5-10min and look something like:  

1. pull the [latest release of the DeploymentKit](https://github.com/csirtgadgets/bearded-avenger-deploymentkit/releases)  
1. bash the easy-button  
```
$ tar -zxvf bearded-avenger-deploymentkit-3.0.x.tar.gz
$ cd bearded-avenger-deploymentkit-3.0.x
$ sudo bash easybutton.sh
```

# Getting Involved
There are many ways to get involved with the project. If you have a new and exciting feature, or even a simple bugfix, simply [fork the repo](https://help.github.com/articles/fork-a-repo), create some simple test cases, [generate a pull-request](https://help.github.com/articles/using-pull-requests) and give yourself credit!

If you've never worked on a GitHub project, [this is a good piece](https://guides.github.com/activities/contributing-to-open-source) for getting started.

* [How To Contribute](contributing.md)  
* [Mailing List](https://groups.google.com/forum/#!forum/ci-framework)  
* [Project Page](http://csirtgadgets.org/collective-intelligence-framework/)

##### Fine Print
_bleeding-edge style distro's (eg: release cycles less than 18-24months, Fedora, non-LTS-release ubuntu, etc...) are highly discouraged and are generally not supported. unless you have giant truck-loads of cash. then we'll consider it... maybe._
