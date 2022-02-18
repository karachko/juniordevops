## task 1
### Manually or automatically created a virtual network in a cloud that includes at least one of the following items: public IP address, subnet, network interface.


[Manually or automatically created a virtual network in a cloud that includes at least one of the following items: public IP address, subnet, network interface.](https://confluence.softserveinc.com/display/SDO/Cloud+Network)
	
Open the Amazon VPC console.

Ensure that you continue working in the required Region.

Choose VPC dashboard, and then choose Launch VPC Wizard.

Choose the option VPC with a Single Public Subnet.

Enter the name for your VPC name (for example, my-vpc), and then enter the name for your Subnet name.

For IPv4 CIDR block, you can leave the default setting (10.0.0.0/16).

For IPv6 CIDR block, choose Amazon-provided IPv6 CIDR block.

For the Public subnet's IPv4 CIDR, leave the default setting.

For the Public subnet's IPv6 CIDR, choose to Specify a custom IPv6 CIDR.

Note: You can leave the default hexadecimal pair value for the IPv6 subnet (00).

Leave the rest of the default configurations on the page, and then select to Create VPC.


![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-18%20at%2013.00.01.png)
![picture 1-2](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-18%20at%2013.00.30.png)


## task 2
### Configured security groups that specify allow rules, separated rules for inbound and outbound traffic, and enable you to filter traffic based on protocols and port numbers.

Open the Amazon VPC console.

In the navigation pane, choose Security Group
.
Select to Create a security group.

Enter the Name and Description for the security group.

From VPC, choose the VPC.

Add security group rule.

For each rule, select Add rule and do the following:

For Type, choose the type of protocol to allow:

For TCP or UDP, enter the port range to allow.

For custom ICMP, choose the ICMP type name from Protocol, and, if applicable, the code name from the Port range.

For any other type, the protocol and port range is configured automatically.

For Source (inbound rules) or Destination (outbound rules), do one of the following to allow traffic:

Choose Custom, and then enter an IP address in CIDR notation, a CIDR block, another security group, or a prefix list.

Choose Anywhere to allow traffic from any IP address to reach your instances (inbound rules) or to allow traffic from your instances to reach all IP addresses 
(outbound rules). Note: This option automatically adds the 0.0.0.0/0 IPv4 CIDR block.

If your security group is in a VPC that's enabled for IPv6, this option automatically adds a rule for the ::/0 IPv6 CIDR block.

For inbound rules, this option is acceptable for a short time in a test environment but is unsafe for production environments. In production, authorize only a specific IP address or range of addresses to access your instances.

Choose My IP to allow traffic only from (inbound rules) or to (outbound rules) your local computer's public IPv4 address.

For Description, specify a brief description of the rule.

![picture 2-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-18%20at%2013.08.00.png)
![picture 2-2](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-18%20at%2013.08.00.png)


## task 3
### Configured ACL that allows specific types of traffic and ports

Open the Amazon VPC console.

In the navigation pane, choose Network ACLs.

Select Create Network ACL.

In the Create Network ACL dialog, optionally name your network ACL, and select the ID of your VPC from the VPC list.

Select Yes, Create.

In the details pane, choose either the Inbound Rules or Outbound Rules tab, depending on the type of rule that you need to add, and then select Edit.

In Rule #, enter the rule number (for example, 100).

Note: The rule number must not already be in use in the network ACL.

Select a rule from the Type list. For example, to add the rule for HTTP, select HTTP. To add the rule to allow all TCP traffic, select All TCP.

 If the protocol you selected requires a port number, enter the port number or the port range separated by a hyphen (for example, 49152-65535).
 
In the Source or Destination field (depending on whether this is an inbound or outbound rule), enter the CIDR range that the rule applies to.

From the Allow/Deny list, select Allow to allow the specified traffic or Deny to deny the specified traffic.

After you've finished, select Save.

