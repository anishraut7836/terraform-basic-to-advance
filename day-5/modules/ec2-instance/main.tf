provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "ami" {
  description = "AWS ec2 AMI for example: ami-xxxxxx"
  type = string
}

variable "ec2_type" {
  description = "AWS ec2 instance type for example: t2.micro"
  type = string
}


resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.ec2_type
}