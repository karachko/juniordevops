# task 1
## Maintenance and support automated configuration of infrastructure environments in project practice

Example of Artifacts:	
- All system configurations are automated, tested, and stored under version control.
- Configuration is validated and applied to the CI/CD system in a fully reproducible way.
- Supporting existing configuration management code.
- Documents or articles about running ad-hoc commands by using some configuration management tools (for example, Ansible, Chef, or Puppet) on the project.


### Launch a VM and install wordpress on it using terraform and ansible

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

- sudo apt-get install python-mysqldb

**The engineer  should install git on local machine**

- sudo apt install git

- git --version




**The engineer  should clone the git repository ”ansible-playbooks”  on local machine**

- git clone https://github.com/do-community/ansible-playbooks.git
- cd ansible-playbooks/wordpress-lamp_ubuntu1804


**The engineer  should copy the key myKey.pem(generate this key)  to directory ~/ansible-playbooks/wordpress-lamp_ubuntu1804**

The engineer should set up permition 400 on file myKey.pem

chmod 400 myKey.pem

**The engineer should create file main.tf in the directory  ~/ansible-playbooks/wordpress-lamp_ubuntu1804**

```
provider "aws" {
    region     = "us-east-1"
    access_key = "***"
    secret_key = "***l"
}
 
variable "key_name" {
    type = string
    default = "myKey"
}
 
variable "ssh_key_private" {
    type = string
    default = "myKey.pem"
}
 
 
resource "aws_security_group" "instance" {
    name = "terraform-example-instance3"
    ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
  }
 
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
  }
 
}
 
resource "aws_instance" "example" {
    ami           = " ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    key_name   = "myKey"
  
 
    vpc_security_group_ids = [aws_security_group.instance.id] 
 
    tags = {
       Name = "WEBWORDPRESS"
                }
   
provisioner "remote-exec" {
        inline = ["sudo apt update", "sudo apt install python3", "echo Done!"]
        connection {
            host        = "${aws_instance.example.public_ip}"
            type        = "ssh"
            user        = "ubuntu"
            private_key="${file("/home/vm1/ansible-playbooks/wordpress-lamp_ubuntu1804/myKey.pem")}"
        }
  }
 
  provisioner "local-exec" {
      command = "sleep 7m;ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${aws_instance.example.public_ip},' --private-key ${var.ssh_key_private} playbook.yml"
  }

}

```



**The engineer should execute following commands**

terraform init

terraform plan

terraform apply

**The engineer should open the browser and enter “aws_instance.example.public_ip”. **

The main page of WordPress will be displayed
![picture 1-2](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2012.58.20.png)


**Ansible ad-hoc commands**


![picture 1-3](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2013.40.49.png)
![picture 1-4](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2014.01.45.png)
![picture 1-5](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2014.02.12.png)
![picture 1-6](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2014.02.25.png)
![picture 1-7](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2014.02.39.png)


### Launch a VM and install LAMP on it using CloudFormation

https://fitdevops.in/deploy-lamp-stack-on-aws-ec2-instance-using-cloudformation/


![picture 1-8](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2011.00.05.png)
![picture 1-9](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2011.00.12.png)
![picture 1-10](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2011.02.54.png)
![picture 1-11](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2011.03.41.png)
![picture 1-12](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2011.03.47.png)
![picture 1-14](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2011.06.56.png)

**Code Cloud Formation**
https://github.com/karachko/juniordevops/blob/main/template1


# task 2
## Store configuration files in the version control system to keep track of any changes in infrastructure code

### Launch a docker with Nginx server using terraform

1. Install docker in Ubuntu
https://docs.docker.com/engine/install/ubuntu/

https://github.com/karachko/juniordevops/blob/main/main.tf

**The engineer should execute following commands**

terraform init

terraform plan

terraform apply

![picture 1-14](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2016.08.21.png)
