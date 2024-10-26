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
  region = var.aws_region.["dev"]
}



resource "aws_instance" "ec2demo-variable" {
  ami           = var.ec2-ami_id.["dev"]
  instance_type = var.ec2_type.["dev"]
  count = var.ec2_count.["dev"]
  tags = {
    Name = "my-ec2-${count.index}"
  }

}



variable "ec2_count" {
  type = map(string)
  default = {
    "dev" = 1
    "stage" = 2
    "prod" = 3
  }
}

variable "ec2-ami_id" {
  type = map(string)
  default = {
    "dev" = "ami-0533f2ba8a1995cf9"
    "stage" = "ami-06b21ccaeff8cd686"
    "prod" = "ami-0acc77abdfc7ed5a6"
  }
  
}

variable "ec2_type" {
  type = map(string)
  default = {
   "dev" = "t2.micro"
   "stage" = "t2.small"
   "prod" = "t2.medium"
   }
}

variable "aws_region" {
  type = map(string)
  default = {
   "dev" = "ap-south-1"
   "stage" = "us-east-1"
   "prod" = "eu-west-2"
  }
  
}