# Configuration and usage of secure shell access to systems and services
## task 1
### Generate Secure Shell (SSH) keys.
Open Terminal.

Paste the text below, substituting in the email address for your account on GitHub.

$ ssh-keygen -t ed25519 -C "karachkonatasha@ukr.net"

Start the ssh-agent in the background.

$ eval "$(ssh-agent -s)"

Add your SSH private key to the ssh-agent and store your passphrase in the keychain.

ssh-add -K ~/.ssh/id_ed25519



























1.  Using the S3 console
[How to Create S3 Bucket in AWS Step by Step](https://cloudkatha.com/how-to-create-s3-bucket-in-aws-step-by-step/)
- 
- Configure source code management (SCM) client with an SSH key (Git).
- Create non-admin users for connecting to the hosts
![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2011.00.40.png)
![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2011.00.40.png)
