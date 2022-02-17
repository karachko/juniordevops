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
ROM ubuntu:18.04

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
