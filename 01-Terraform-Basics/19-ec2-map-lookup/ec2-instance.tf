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

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_ami" {
  type = map
  default = {
    us-east-1 = "ami-0533f2ba8a1995cf9"    # Amazon Linux in us-east-1
    ap-south-1 = "ami-04a37924ffe27da53"   # Amazon Linux in ap-south-1
  }
}

#Resource Block
resource "aws_instance" "ec2demo" {
  ami           = lookup(var.aws_ami,var.aws_region)
  instance_type = "t2.micro"

}


