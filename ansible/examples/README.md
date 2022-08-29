# ansible

### Run the playbook
```bash
ansible-playbook -l [target] -i [inventory file] -u [remote user] playbook.yml
```
example:
```bash
ansible-playbook playbook.yml -l server1 -u myuser
```
or
```sh
ansible-playbook -i hosts tc.yml
```

run on local machine
```bash
# hosts
127.0.0.1 ansible_connection=local
```
run install
```bash
ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml
```

### Test environment
example for docker_debian10 playbook
```bash
# docker image pull
docker pull debian:buster

# run the image
docker run --rm -it debian:buster

# install
apt-get update
apt-get install ansible git wget nano python -y
git clone https://github.com/NAndras95/ansible.git
cp ansible/hosts.localhost.example ansible/docker_debian10/hosts
cd ansible/docker_debian10
ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml
```
