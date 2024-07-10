resource "aws_instance" "bastion" {
  ami           = data.aws_ami.latest-amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = "${aws_key_pair.deployer.key_name}"
  tags = {
    Name   = "Bastion Server"
    Env    = var.env
    Dev    = var.dev
    Author = var.author
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnets[1]
  user_data     = <<-EOF
	#! /bin/bash
	sudo yum update
	sudo yum install -y httpd
	sudo chkconfig httpd on
	sudo service httpd start
	echo "<h1>Hello from Servet INCE</h1>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name   = "Web Server"
    Env    = var.env
    Dev    = var.dev
    Author = var.author
  }
}


resource "aws_network_interface_sg_attachment" "sg_attachment_bastion" {
  security_group_id    = "${aws_security_group.bastion.id}"
  network_interface_id = "${aws_instance.bastion.primary_network_interface_id}"
}

resource "aws_network_interface_sg_attachment" "sg_attachment_web" {
  security_group_id    = "${aws_security_group.web.id}"
  network_interface_id = "${aws_instance.web.primary_network_interface_id}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${file("${var.sshpubkey_file}")}"
}
#commit 1
#commit 2
#commit 3