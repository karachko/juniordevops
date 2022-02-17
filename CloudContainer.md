## task 2
### Amazon Linux container image—link


[Amazon Linux container image](https://docs.aws.amazon.com/AmazonECR/latest/userguide/amazon_linux_container_image.html)

[Using Amazon ECR with the AWS] (https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html)

**Step 1: Install the AWS CLI**

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

unzip awscli-bundle.zip

sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

sudo ln -s /folder/installed/aws-cli/aws /usr/local/bin/aws

sudo ln -s /folder/installed/aws-cli/aws_completer /usr/local/bin/aws_completer

**Step 2: Install the Homebrew**

curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

**Step 3: Install the docker**

brew install docker 

**Step 4: To create a Docker image of a simple web application**

1. Create a file called Dockerfile

touch Dockerfile

2. Edit the Dockerfile you just created and add the following content.

```
FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
 apt-get -y install apache2

# Install apache and write hello world message
RUN echo 'Hello World!' > /var/www/html/index.html

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
```
3. Build the Docker image from your Dockerfile.

docker build -t hello-world .
4. Run docker images to verify that the image was created correctly.

docker images --filter reference=hello-world

5. Run the newly built image. The -p 80:80 option maps the exposed port 80 on the container to port 80 on the host system. For more information about docker run, go to the Docker run reference.

docker run -t -i -p 80:80 hello-world

**Step 5: Authenticate to your default registry**

 1. aws configure
 
AWS Access Key ID [****************6872]: A*****D
AWS Secret Access Key [****************25fl]: 0*******25fl
Default region name [None]: us-east-1
Default output format [None]: 

2. aws ecr get-login-password

3. aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 076441096872.dkr.ecr.us-east-1.amazonaws.com


**Step 6:  Create a repository**
```
aws ecr create-repository \
    --repository-name hello-world \
    --image-scanning-configuration scanOnPush=true \
    --region region
```

**Step 7: Push an image to Amazon ECR**

1. docker images
2. docker tag hello-world:latest 076441096872.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest
3. docker push 076441096872.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest

**Step 8: Pull an image from Amazon ECR**

1. docker rmi hello-world:latest
2. docker pull 076441096872.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest

![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-17%20at%2017.26.09.png)

![picture 1-2](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-17%20at%2017.26.09.png)

**Step 9:  pull the Amazon Linux container image from Amazon ECR Public**

1. Authenticate your Docker client to the Amazon Linux Public registry. Authentication tokens are valid for 12 hours.

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws

2. Pull the Amazon Linux container image using the docker pull command. 

docker pull public.ecr.aws/amazonlinux/amazonlinux:latest

3. Run the container locally.

docker run -it public.ecr.aws/amazonlinux/amazonlinux /bin/bash

 ![picture 1-3](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-17%20at%2018.48.15.png)
