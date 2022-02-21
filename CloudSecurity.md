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

**Describe the concept of public and private keys and specify when to use each type**

Public-key cryptography, or asymmetric cryptography, is a cryptographic system that uses pairs of keys. Each pair consists of a public key (which may be known to others) and a private key (which may not be known by anyone except the owner). The generation of such key pairs depends on cryptographic algorithms which are based on mathematical problems termed one-way functions. Effective security requires keeping the private key private; the public key can be openly distributed without compromising security.[1]
In such a system, any person can encrypt a message using the intended receiver's public key, but that encrypted message can only be decrypted with the receiver's private key. This allows, for instance, a server program to generate a cryptographic key intended for a suitable symmetric-key cryptography, then to use a client's openly-shared public key to encrypt that newly generated symmetric key. The server can then send this encrypted symmetric key over an insecure channel to the client; only the client can decrypt it using the client's private key (which pairs with the public key used by the server to encrypt the message). With the client and server both having the same symmetric key, they can safely use symmetric key encryption (likely much faster) to communicate over otherwise-insecure channels. This scheme has the advantage of not having to manually pre-share symmetric keys (a fundamentally difficult problem) while gaining the higher data throughput advantage of symmetric-key cryptography.

Compared to symmetric encryption, asymmetric encryption is rather slower than good symmetric encryption, too slow for many purposes.


Two of the best-known uses of public key cryptography are:
	•	Public key encryption, in which a message is encrypted with the intended recipient's public key. For properly chosen and used algorithms, messages cannot in practice be decrypted by anyone who does not possess the matching private key, who is thus presumed to be the owner of that key and so the person associated with the public key. This can be used to ensure confidentiality of a message.
	•	Digital signatures, in which a message is signed with the sender's private key and can be verified by anyone who has access to the sender's public key. This verification proves that the sender had access to the private key, and therefore is very likely to be the person associated with the public key. This also ensures that the message has not been tampered with, as a signature is mathematically bound to the message it originally was made from, and verification will fail for practically any other message, no matter how similar to the original message.
The most obvious application of a public key encryption system is for encrypting communication to provide confidentiality – a message that a sender encrypts using the recipient's public key which can be decrypted only by the recipient's paired private key.
Another application in public key cryptography is the digital signature. Digital signature schemes can be used for sender authentication.
Non-repudiation systems use digital signatures to ensure that one party cannot successfully dispute its authorship of a document or communication.



## task 2
### Demonstrate an ability to sign in to any of SCM providers (such as GitHub, GitLab, or Bitbucket) using an SSH key.

1. Open **GitHub.com** -  **Settings - SSH and GPG keys - Add SSH key**

In the "Title" field, add a descriptive label for the new key. 
For example, if you're using a personal Mac, you might call this key "Personal MacBook Air".

Paste your key into the "Key" field.

2. Testing your SSH connection

Open Terminal.

Enter the following:

$ ssh -T git@github.com

![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2015.28.01.png)


## task 3
### Demonstrate the ability to login to Linux host using non-root account and escalate own permissions.

1. Log in to aws server

ssh -i m11111y.pem ubuntu@ec21111117.compute-1.amazonaws.com

2. Add user

sudo adduser test

3. Log in with test user 

su - test


# Secure network infrastructure

- Examples of cloud configuration (NACLs, SGs).
[Examples of cloud configuration (NACLs, SGs).](https://github.com/karachko/juniordevops/blob/main/CloudNetwork.md)


- Described configured principles of the least access privileges model.

The principle of least privilege requires that a user be given no more privileges than necessary to perform his/her job function.9 By limiting access to only the required users, the risk introduced is reduced to an acceptable and manageable level.

- Described bastion host with its advantages and disadvantages.

A bastion host is a server whose purpose is to provide access to a private network from an external network, such as the Internet. Because of its exposure to potential attack, a bastion host must minimize the chances of penetration.Disadvantages of bastion hosts


The disadvantages are:

It is generally used only for SSH access to remote servers

To access applications running on a private network, for example, on port 8080, bastion is not the solutio- Described implemented shared responsibility model.




- Described implemented shared responsibility model.

For example, in IaaS, the cloud provider supplies and is responsible for securing basic cloud infrastructure components, such as virtual machines, disks and networks, according to the CSCC. The provider is also responsible for the physical security of the data centers that house its infrastructure. IaaS users, on the other hand, are generally responsible for the security of the operating system and software stack required to run their applications, as well as their data.Simply put, the cloud provider is responsible for the security of the cloud, while the customer is responsible for security in the cloud. Essentially, your cloud provider is responsible for making sure your infrastructure built within its platform is inherently secure and reliable.
