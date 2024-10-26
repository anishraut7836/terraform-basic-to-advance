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
  instance_type = var.ec2_type["0"]
  count = var.ec2_count
  tags = {
    Name = "my-ec2-${count.index}"
  }

}



variable "ec2_count" {

  default = 2
}

variable "ec2-ami_id" {
  type = string
  default = "ami-04a37924ffe27da53"

  
}

variable "ec2_type" {
  type = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

variable "aws_region" {
  default = "ap-south-1"
  
}