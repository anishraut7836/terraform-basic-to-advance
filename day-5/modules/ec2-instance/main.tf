provider "aws" {
  region = var.region
}

variable "region" {
  description = "AWS region"
  type = string
 
}

variable "ami" {
  description = "AWS ec2 AMI for example: ami-xxxxxx"
  type = string
}

variable "instance_type" {
  description = "AWS ec2 instance type for example: t2.micro"
  type = string
}


resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
}