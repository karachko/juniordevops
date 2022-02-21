# Configuration and usage of secure shell access to systems and services
## task 1
### Generate Secure Shell (SSH) keys.
1. Open Terminal.

2. Paste the text below, substituting in the email address for your account on GitHub.

$ ssh-keygen -t ed25519 -C "karachkonatasha@ukr.net"

3. Start the ssh-agent in the background.

$ eval "$(ssh-agent -s)"

4. Add your SSH private key to the ssh-agent and store your passphrase in the keychain.

ssh-add -K ~/.ssh/id_ed25519

5. cat id_ed25519.pub

6. Open **GitHub.com** -  **Settings - SSH and GPG keys - Add SSH key**

In the "Title" field, add a descriptive label for the new key. 
For example, if you're using a personal Mac, you might call this key "Personal MacBook Air".

Paste your key into the "Key" field.

7. Testing your SSH connection

Open Terminal.

Enter the following:

$ ssh -T git@github.com

![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2011.00.40.png)




















1.  Using the S3 console
[How to Create S3 Bucket in AWS Step by Step](https://cloudkatha.com/how-to-create-s3-bucket-in-aws-step-by-step/)
- 
- Configure source code management (SCM) client with an SSH key (Git).
- Create non-admin users for connecting to the hosts
![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2011.00.40.png)
![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2011.00.40.png)
