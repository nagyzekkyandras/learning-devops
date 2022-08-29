# Ansible
Ansible is a suite of software tools that enables infrastructure as code. It is open-source and the suite includes software provisioning, configuration management, and application deployment functionality.

Ansible is agentless, relying on temporary remote connections via SSH or Windows Remote Management which allows script execution. The Ansible control node runs on most Unix-like systems that are able to run Python.

## Install
With python:
```sh
python3 -m pip install --user ansible
```
Linux:
```
yum install epel-release
yum install ansible
```
```
apt update
apt install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible
```

## Examples
[Ansible examples.](./examples/README.md.md)