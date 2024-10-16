provider "aws" {
  region = var.region
}

variable "region" {
default = "us-west-2"
}

variable "ami" {}
variable "instance_type" {}

module "ec2_instance" {
  source = "./modules/ec2-instance"
  region = var.region
  ami = var.ami
  instance_type = var.instance_type
}