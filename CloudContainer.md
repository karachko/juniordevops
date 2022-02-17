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
