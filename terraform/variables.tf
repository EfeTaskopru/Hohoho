variable "access_key" {}
variable "secret_key" {}
variable "env" {}
variable "dev" {}
variable "author" {}

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.9.0.0/16"
}
variable "private_subnets" {
  default = ["10.9.0.0/24", "10.9.1.0/24"]
}
variable "public_subnets" {
  default = ["10.9.10.0/24", "10.9.11.0/24"]
}
variable "database_subnets" {
  default = ["10.9.20.0/24", "10.9.21.0/24"]
}
variable "sshpubkey_file" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}
