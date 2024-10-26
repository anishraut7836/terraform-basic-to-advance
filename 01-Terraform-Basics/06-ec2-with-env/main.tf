##Terraform setting block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Provider block
provider "aws" {
  region = var.aws_region
}


resource "aws_instance" "ec2demo-variable" {
  ami           = var.ec2-ami_id
  instance_type = var.ec2_type
  count = var.ec2_count
  tags = {
    Name = "my-ec2-${count.index}"
  }

}



variable "ec2_count" {

}

variable "ec2-ami_id" {

}

variable "ec2_type" {

}

variable "aws_region" {

}