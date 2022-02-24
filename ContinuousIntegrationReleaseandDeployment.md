## task 1
### Jenkins

**Support an existed Continuous Delivery/Deployment (CD) flow**
**Support an existed Continuous Integration (CI) flow**
1. I installed EC2-Jenkins and Jenkins
I selected EC2 from All services on AWS
- I selected Ubuntu Server 18.04 LTS
- I chose Instant Type t2.micro
- I pressed the button Next
- I pressed the button Next
- I pressed the button Add Tag
- I filled out the fields (key - name, value - jenkins)
- I pressed the button Next
- I selected Add Rule and filled out the fields (Type - Custom TCP, Protocol - TCP, Port Range -8080,Source -Anywere 0.0.0.0/0, ::/0)
- I pressed the button Launch
- I selected Create key pair
- I entered the KeyJenkins and pressed the button Download Key Pair KeyJenkins.pem.
2. I installed Jenkins on EC2-Jenkins
- wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
- sudo nano /etc/apt/sources.list
- #Add next string after last row in the editing file
- deb https://pkg.jenkins.io/debian-stable binary/
- #And save changes
- sudo apt-get update
- java -version
- sudo apt-get install openjdk-8-jdk
- sudo apt-get install jenkins
- service jenkins status


- sudo systemctl start jenkins
- sudo systemctl status jenkins
- sudo ufw allow 8080
- sudo cat /var/lib/jenkins/secrets/initialAdminPassword

- I lanched the Jenkins by opening http://3.89.137.52:8080/ in the browser
- I enetered the Administraion password (sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

- I enetered the Administraion password
- I enetered the student login 

3. I created user student on the Jenkins
- sudo useradd student
- sudo passwd student
- sudo mkdir /home/student
- sudo chown student:student /home/student

4. 
- On the Jenkins sever
- I executed (su - student)
- I created the pair of keys with (ssh-keygen). In the folder .ssh the keys(id_rsa and id_rsa.pub) were cteated.

- On the Apache Server I installed ssh (sudo apt-get install ssh)
- sudo nano /etc/ssh/sshd_config (AllowUsers student, PasswordAuthentication yes , PubkeyAuthentication yes)
- sudo systemctl restart sshd

- On the Jenkins sever
- I copied public key to /home/student/.ssh/authorized_keys using the command 
ssh-copy-id student@34.229.156.25

- On the Jenkins sever(I copied the keys to /var/lib/jenkins/.ssh/)
- cd  /var/lib/jenkins/
- sudo mkdir .ssh
- sudo cp /home/student/.ssh/id_rsa  /var/lib/jenkins/.ssh/
- sudo cp /home/student/.ssh/id_rsa.pub  /var/lib/jenkins/.ssh/
- sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh

5
- On the Gihub Setting-SSH and GPG keys - New SSH keys
- (jenkins keys)
- cat id_rsa.pub

6. In Jenkins I set up credentials
7
