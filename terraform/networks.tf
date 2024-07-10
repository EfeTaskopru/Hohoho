module "vpc" {
  name   = "foo-vpc"
  source = "terraform-aws-modules/vpc/aws"

  cidr = "10.9.0.0/16"

  azs = [
    "${data.aws_availability_zones.available.names[0]}",
    "${data.aws_availability_zones.available.names[1]}",
  ]

  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  public_subnet_tags = {
    Env    = var.env
    Dev    = var.dev
    Author = var.author
  }

  private_subnet_tags = {
    Env    = var.env
    Dev    = var.dev
    Author = var.author
  }

  database_subnet_tags = {
    Env    = var.env
    Dev    = var.dev
    Author = var.author
  }

  create_database_subnet_group = false
  enable_dns_hostnames         = true
  enable_dns_support           = true
}
