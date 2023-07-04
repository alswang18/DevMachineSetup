# DevMachineSetup
Scripts to setup a new machine (Ansible, etc)

# Generate SSH key pair
ssh-keygen -t rsa -b 4096

# Encrypt the private key using Ansible Vault
sudo chmod 644 /home/alecwang/ssh_files/id_rsa
sudo chmod 644 /home/alecwang/ssh_files/id_rsa.pub
ansible-vault encrypt ./ssh_files/id_rsa --ask-vault-pass