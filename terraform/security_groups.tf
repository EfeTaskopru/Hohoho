resource "aws_security_group" "packer_build" {
  name        = "packer-build"
  description = "Security Group for Packer Builds"
  vpc_id      = "${module.vpc.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "packer-build"
  }
}


resource "aws_security_group" "bastion" {
  name        = "Bastion SG"
  description = "Bastion SG created by SINCE"
  vpc_id      = "${module.vpc.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastionSG"
  }
}


resource "aws_security_group" "web" {
  name        = "Web SG"
  description = "Web SG created by SINCE"
  vpc_id      = "${module.vpc.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.bastion.id}"]
  }

  tags = {
    Name = "websSG"
  }
}
