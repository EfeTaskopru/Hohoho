SERVET INCE // Solution

=======================================================================================

Prerequisites

AWS account (we recommend you use eu-west-1

Gitlab account

The following software installed:

Git
Terraform

=======================================================================================

--> In the working directory please run the command in order;

1.) aws configure 
2.) terraform plan
3.) terraform validate
4.) terraform apply -auto-approve


Please note whenever you run terraform command you will be asked for the following variable. You need to fill as below example;

access_key = xxxxxxxxxxxxxxxxxxxx
secret_key = xxxxxxxxxxxxxxxxxxxxxxx
env = private
dev = yes
author = sservett
sshpubkey_file = /root/.ssh/id_rsa.pub   

=======================================================================================

HOW TO CONNECT BASTION HOST;

/root/.ssh/id_rsa.pub   --> In order to connect BASTION HOST copy private key of this public key your current directory, and then follow up the instructions below

To access your BASTION  instance:

1.) Open an SSH client. (find out how to connect using PuTTY)

2.) Locate your private key file (deployer-key.pem). The wizard automatically detects the key you used to launch the instance.

3.) Your key must not be publicly viewable for SSH to work. Use this command if needed:

chmod 400 deployer-key.pem

4.) Connect to your instance using its Public DNS:

ec2-54-175-120-21.compute-1.amazonaws.com

Example:

ssh -i "deployer-key.pem" ec2-user@ec2-54-175-120-21.compute-1.amazonaws.com

=======================================================================================

HOW TO TEST WEB SERVER;

1.) Connect BASTION host

2.) Run the following command;

   curl "Web Serverv IPv4 Public IP"
   curl "Web Server Public DNS (IPv4)"

=======================================================================================


V-Nova DevOps Recruitment Tasks
Fork the repository in Gitlab and make the changes in your fork (you can make your fork private, but you will need to give v-nova-group access to your private project).
Please focus on Task 2 only.   You can use any AMI that deploys a web server for this.  Feel free to look at the other tasks if you wish; they, or similar things, may be discussed at the final interview stage, but these tasks are not required at this point.
Please update the README.md with any details that we will need to correctly run and evaluate the tasks. This should include any dependencies that you might have introduced.
Once you have completed the tasks, please send us details of your fork.

Prerequisites

AWS account (we recommend you use eu-west-1

Gitlab account
The following software installed:

Git
Packer
Ansible
Terraform

Task 2
In the terraform directory, you will find some terraform code. It will not immediately work, so please fix the errors (errors may occur during apply as well as plan).
Once you are in a position to run apply cleanly, please complete the following sub tasks:


 Add tags to all instances and private/public subnets ({"env": "dev", "author": <YOUR GITLAB ID>})

 Enable VPC DNS Support

 Launch a bastion host using the latest Amazon Linux AMI

 Launch a simple webserver using the latest AMI built from Task 1

 Create an S3 bucket for Task 3


Additional Notes:


Terraform is already set to use t2.micro instance type. So doing this task should not incur costs (all within AWS free tier), but remember to delete any AMI snapshots when you're done as those will start costing after a while.


Webserver should only be accessible using port 80


Webserver should only allow SSH from Bastion host


Bastion host only allows port 22


We will expect to test the Terraform code, so avoid hard coding anything.


The AMI used should not be pinned to any particular version, but to the 'latest'. So if we run the code today, we get the lastest version today and if we run the code in a month we get the latest version then
