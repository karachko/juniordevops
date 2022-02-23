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

# task 3
## Use infrastructure as a code tool for provisioning infrastructure (all requests from the list in description)
### Configuring app server environment with Roles(apache role (which will Install httpd package, Start httpd service, Add a handler to restart service) and php role(install php and php-mysql, restart apache when packages are installed))

https://ansible-tutorial.schoolofdevops.com/roles/

1. Generate role scaffolding using ansible-galaxy

ansible-galaxy init --offline --init-path=roles  apache

2. To install apache, Create roles/apache/tasks/install.yml

```
---
  - name: install apache web server
    apt:
      name: apache2
      state: latest


```
3. To start the service, create roles/apache/tasks/service.yml with the following content

```
---
  - name: start apache webserver
    service:
      name: apache2
      state: started
      enabled: true

```

4. To have these tasks being called, include them into main task.

Edit roles/apache/tasks/main.yml

```
# tasks file for apache
  - import_tasks: install.yml
  - import_tasks: service.yml



```

5. Create a playbook for app servers app.yml(in the directory /home/ubuntu) with following contents
```
  ---
  - hosts: localhost
    become: true
    roles:
      - apache
      - php
      
 ```     
6.  Create the notification handler by updating roles/apache/handlers/main.yml

``` 
--
  - name: Restart apache service
    service: name=apache2 state=restarted
```
7. 
Generate roles 

roles/php/tasks/install.yml
```
---
# install php related packages
  - apt: install php
    package:
      name: "{{ item }}"
      state: installed
    with_items:
      - php
      - php-mysql
    notify: Restart apache service
```

8. 
Create file: roles/php/tasks/main.yml
```
---
# tasks file for php
- import_tasks: install.yml

```
9.

Apply the playbook

ansible-playbook app.yml


![picture 1-14](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-22%20at%2019.51.58.png)


### Terraform files with modules structure that describe the minimum valuable version of a cloud environment (for example, VPC, EC2, private or public subnets, IG, SG, IAM).

1. I installed the latest version of terraform 
https://computingforgeeks.com/how-to-install-terraform-on-ubuntu/

2. I use this link to do this task

https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/master/examples/network-acls

/home/ubuntu/terraform-aws-vpc/examples/network-acls

main.tf

```
provider "aws" {
  region     = local.region
  access_key ="****"
  secret_key ="******"
 
}

locals {
  region = "us-east-1"
  
  network_acls = {
    default_inbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    default_outbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 32768
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
  public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 3389
        to_port     = 3389
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number     = 140
        rule_action     = "allow"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
    ]
 public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 1433
        to_port     = 1433
        protocol    = "tcp"
        cidr_block  = "10.0.100.0/22"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "10.0.100.0/22"
      },
      {
        rule_number = 140
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = 8
        protocol    = "icmp"
        cidr_block  = "10.0.0.0/22"
      },
      {
        rule_number     = 150
        rule_action     = "allow"
        from_port       = 90
        to_port         = 90
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
    ]
      
    elasticache_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 140
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = 12
        protocol    = "icmp"
        cidr_block  = "10.0.0.0/22"
      },
      {
        rule_number     = 150
        rule_action     = "allow"
        from_port       = 90
        to_port         = 90
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
    ]
  }
}


################################################################################
# VPC Module
################################################################################

module "vpc" {

  source  = "../../"

  # insert the 23 required variables here


  name = "network-acls-example"
  cidr = "10.0.0.0/16"

  azs                 = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  elasticache_subnets = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]

  public_dedicated_network_acl   = true
  public_inbound_acl_rules       = concat(local.network_acls["default_inbound"], local.network_acls["public_inbound"])
  public_outbound_acl_rules      = concat(local.network_acls["default_outbound"], local.network_acls["public_outbound"])
  elasticache_outbound_acl_rules = concat(local.network_acls["default_outbound"], local.network_acls["elasticache_outbound"])

  private_dedicated_network_acl     = false
  elasticache_dedicated_network_acl = true

  manage_default_network_acl = true

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}



```

outputs.tf

```
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc.default_security_group_id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.vpc.default_network_acl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = module.vpc.default_route_table_id
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = module.vpc.vpc_instance_tenancy
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.vpc.vpc_enable_dns_support
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.vpc.vpc_enable_dns_hostnames
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = module.vpc.vpc_main_route_table_id
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = module.vpc.vpc_ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block"
  value       = module.vpc.vpc_ipv6_cidr_block
}

output "vpc_secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks of the VPC"
  value       = module.vpc.vpc_secondary_cidr_blocks
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = module.vpc.vpc_owner_id
}



```
versions.tf

```
erraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

```

![picture 1-15](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-23%20at%2018.02.26.png)

![picture 1-16](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-23%20at%2018.02.57.png)


![picture 1-17](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-23%20at%2018.39.06.png)
