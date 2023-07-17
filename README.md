# DevMachineSetup

Scripts to setup a new machine (Ansible, etc)
## Run before executing anything for Ubuntu
```shell
sudo apt-get update && sudo apt-get upgrade -y \
    && sudo apt-get install -y software-properties-common curl git build-essential sudo unzip nano fzf \
    && sudo apt-add-repository -y ppa:ansible/ansible \
    && sudo apt-get update && sudo apt-get install -y curl git ansible build-essential \
    && sudo apt-get clean autoclean \
    && sudo apt-get autoremove --yes \
    && sudo sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc

```
## Generate SSH key pair

To generate an SSH key pair, run the following command:

```shell
ssh-keygen -t rsa -b 4096
```

## Encrypt the private key using Ansible Vault

Before encrypting the private key, make sure to set the correct file permissions:

```shell
sudo chmod 644 /home/alecwang/ssh_files/id_rsa
sudo chmod 644 /home/alecwang/ssh_files/id_rsa.pub
```

To encrypt the private key using Ansible Vault, use the following command:

```shell
ansible-vault encrypt ./ssh_files/id_rsa --ask-vault-pass
```

Remember to provide the Ansible Vault password when prompted.

## Test new changes on docker version of new computer

```shell
./build-dockers.sh && docker run --rm -it new-computer
```
