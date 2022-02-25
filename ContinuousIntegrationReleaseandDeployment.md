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

5.
- On the Gihub Setting-SSH and GPG keys - New SSH keys
- (jenkins keys)
- cat id_rsa.pub

6. In Jenkins I set up credentials for SSH
![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-24%20at%2017.28.33.png)

7. I created "Build" "Deploy" pipeline

```

pipeline {
    agent any
    
    stages {
    
        stage('Build') {
            steps {
                git 'https://github.com/karachko/FinalTask'
            }
        }
    
        stage('Deploy') {
            steps {
                sh "scp -v -o StrictHostKeyChecking=no index.html student@34.201.76.183:/home/student"
            }
        }
        
    }
}

```

```
pipeline {
    agent any
    tools { 

        maven 'maven363'

        jdk 'jdk8'
    }

    stages {

        stage('Clonning repo from Git hub') {

            steps {

                git 'https://github.com/wyona/spring-boot-hello-world-rest'
           

            }

        }



        stage('Build') {


            steps {


                sh 'mvn clean install'


            }


        }

       


        stage('Publishing site on the Docker-Web') {


            steps {

                       


                sshPublisher(publishers: [sshPublisherDesc(configName: 'Docker', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ls -la', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/home/student/', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])


            }


        }


                


    }


}


```
## task 2
### AWS CodePipeline

**Support an existed Continuous Delivery/Deployment (CD) flow**

1. AWS Elastic beanstalk-Create app

![picture 2-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-25%20at%2017.27.14.png)

2. Web app is available from the link

![picture 2-2](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-25%20at%2011.51.59.png)



3. AWS CodePipeline-create pipeline (deploy on created Elastic beanstalk server)

![picture 2-3](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-25%20at%2011.54.33.png)

![picture 2-4](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-25%20at%2011.59.03.png)

![picture 2-5](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-25%20at%2012.02.26.png)

![picture 2-6](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-25%20at%2015.08.59.png)
