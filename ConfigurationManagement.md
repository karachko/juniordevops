# task 1
## Maintenance and support automated configuration of infrastructure environments in project practice

Example of Artifacts:	
- All system configurations are automated, tested, and stored under version control.
- Configuration is validated and applied to the CI/CD system in a fully reproducible way.
- Supporting existing configuration management code.
- Documents or articles about running ad-hoc commands by using some configuration management tools (for example, Ansible, Chef, or Puppet) on the project.


### Launch a VM and install wordpress on it using terraform and ansible!

**The engineer  should install terraform on local machine**

Install unzip
 sudo apt-get install unzip
 
 Confirm the latest version number on the terraform website:
https://www.terraform.io/downloads.html

 Download latest version of the terraform
wget https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip

Extract the downloaded file archive
unzip terraform_1.0.8_linux_amd64.zip

 Move the executable into a directory searched for executables
sudo mv terraform /usr/local/bin/
terraform -v


**The engineer  should install ansible on local machine**

- sudo apt-add-repository ppa:ansible/ansible
- sudo apt update
- sudo apt install ansible
- ansible --version

- sudo apt install python-pip
- sudo pip install ansible
- ansible --version

**The engineer  should install git on local machine**

- sudo apt install git

- git --version


**The engineer should generate the key**

- mkdir .ssh
- cd ssh
- ssh-keygen
- chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub
- ssh-copy-id ubuntu@52.203.242.121

- sudo nano /etc/ansible/hosts

[webwordpress]

ubuntu@52.203.242.121 ansible_ssh_private_key_file=/home/ubuntu/.ssh/id_rsa


- sudo nano /etc/ssh/sshd_config

PubkeyAuthentication yes

PasswordAuthentication yes

sudo systemctl restart ssh

ansible webwordpress -m ping































[Manually or automatically created a virtual network in a cloud that includes at least one of the following items: public IP address, subnet, network interface.](https://confluence.softserveinc.com/display/SDO/Cloud+Network)


![picture 2-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-18%20at%2013.08.00.png)
