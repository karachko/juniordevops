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

To connect to your Windows instance using an RDP client

1. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

2. In the navigation pane, select Instances. Select the instance and then choose Connect.

3. On the Connect to instance page, choose the RDP client tab, and then choose Get password.

4. Choose Browse and navigate to the private key (.pem) file you created when you launched the instance. 

**Step 3: Clean up your instance**

1. In the navigation pane, choose Instances. In the list of instances, select the instance.

2. Choose Instance state, Terminate instance.

3. Choose Terminate when prompted for confirmation.


![picture 1-1-3](https://github.com/karachko/DevOps_online_Chernivtsi_2021Q2/blob/main/m1/task2.1/1-1-3.png)
Amazon EC2 Linux instances—link.
