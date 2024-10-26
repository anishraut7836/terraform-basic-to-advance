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

#Resource Block
#EC2 value are hard coded
/*
resource "aws_instance" "ec2demo" {
  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = "my-ec2-${count.index}"
  }

}
*/

resource "aws_instance" "ec2demo-variable" {
  ami           = var.ec2-ami_id
  instance_type = var.ec2_type
  count = var.ec2_count
  tags = {
    Name = "my-ec2-${count.index}"
  }

}



variable "ec2_count" {
  default = 3
}

variable "ec2-ami_id" {
  default = "ami-0533f2ba8a1995cf9"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}