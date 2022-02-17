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
PuTTY

SSH client

AWS Systems Manager Session Manager


**Step 3: Clean up your instance**

1. In the navigation pane, choose Instances. In the list of instances, select the instance.

2. Choose Instance state, Terminate instance.

3. Choose Terminate when prompted for confirmation.


![picture 1-1-3](https://github.com/karachko/DevOps_online_Chernivtsi_2021Q2/blob/main/m1/task2.1/1-1-3.png)


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
   install the AWS CLI on macOS
   
   download the macOS pkg file: https://awscli.amazonaws.com/AWSCLIV2.pkg
   
   in terminal 
   
   ` sudo ln -s /folder/installed/aws-cli/aws /usr/local/bin/aws
     sudo ln -s /folder/installed/aws-cli/aws_completer /usr/local/bin/aws_completer. ` 
     
   1.1. SSH client
   Connect to your Linux instance using an SSH client
   ssh -i /path/my-key-pair.pem my-instance-user-name@my-instance-public-dns-name
   
   1.2. EC2 Instance Connect

   1.3. AWS Systems Manager Session Manager





**Step 3: Clean up your instance**

1. In the navigation pane, choose Instances. In the list of instances, select the instance.

2. Choose Instance state, Terminate instance.

3. Choose Terminate when prompted for confirmation.


