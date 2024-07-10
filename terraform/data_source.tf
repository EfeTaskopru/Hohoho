data "aws_availability_zones" "available" {}


data "aws_ami" "amazon_linux" {
  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-2.0.20180810-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}
data "aws_ami" "latest-amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-2.0.*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}
