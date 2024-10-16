provider "aws" {
  region = var.region
}

variable "region" {}
variable "ami" {}
variable "instance_type" {}

module "ec2_instance" {
  source = "./modules/ec2-instance"
  ami = var.ami
  instance_type = var.instance_type
}