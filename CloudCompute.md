## task 1
### Amazon EC2 Windows instances—link.


[Amazon EC2 Windows instances](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/EC2_GetStarted.html)

**Step 1: Launch an instance**

1. To launch an instance

2. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

3. Select the AMI for Windows Server 2016 Base 

4. Select the t2.micro instance type

5. Choose Edit security groups. On the Configure Security Group page, ensure that Select an existing security group is selected.

6. On the Review Instance Launch page, choose Launch.

7. When prompted for a key pair, select Choose an existing key pair. Note that you must select an RSA key.

**Step 2: Connect to your instance**

If your local computer operating system is Windows

To connect to your Windows instance using an RDP client

Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

In the navigation pane, select Instances. Select the instance and then choose Connect.

On the Connect to instance page, choose the RDP client tab, and then choose Get password.


Choose Browse and navigate to the private key (.pem) file you created when you launched the instance. Select the file and choose Open to copy the entire contents of the file to this window.

Choose Decrypt Password. The console displays the default administrator password for the instance under Password, replacing the Get password link shown previously. Save the password in a safe place. This password is required to connect to the instance.

Choose Download remote desktop file. WindowServer.rdp

Launch Microsoft Remote Desktop

![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-17%20at%2015.33.38.png)


PuTTY

SSH client

AWS Systems Manager Session Manager


**Step 3: Clean up your instance**

1. In the navigation pane, choose Instances. In the list of instances, select the instance.

2. Choose Instance state, Terminate instance.

3. Choose Terminate when prompted for confirmation.





### Amazon EC2 Linux instances—link.
[Amazon EC2 Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)

**Step 1: Launch an instance**

1. To launch an instance

2. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

3. Select the AMI for Amazon Linux 2.  

4. Select the t2.micro instance type

5. Choose Edit security groups. On the Configure Security Group page, ensure that Select an existing security group is selected.

6. On the Review Instance Launch page, choose Launch.

7. When prompted for a key pair, select Choose an existing key pair. 

**Step 2: Connect to your instance**


1. If your local computer operating system is Linux or macOS X

     
   1.1. SSH client
   Connect to your Linux instance using an SSH client
   chmod 400 myKey.pem
   ssh -o "IdentitiesOnly=yes" -i myKey.pem ec2-user@ec2-18-233-0-217.compute-1.amazonaws.com
   
   ![picture 1-2](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-17%20at%2015.16.07.png)   
   
   1.2. EC2 Instance Connect

   1.3. AWS Systems Manager Session Manager


**Step 3: Clean up your instance**

1. In the navigation pane, choose Instances. In the list of instances, select the instance.

2. Choose Instance state, Terminate instance.

3. Choose Terminate when prompted for confirmation.

### Launch  EC2 Linux using terraform
```
provider "aws" {
  region     = "us-east-1"
  access_key = "*****"
  secret_key = "*******"
  
}

variable "ssh_key_private" {
  type = string
  default = "myKey.pem"
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
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
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  key_name      = var.ssh_key_private
  
 
  vpc_security_group_ids = [aws_security_group.instance.id] 
 
  tags = {
    Name = "WEBWORDPRESS"
         } 
 ```
