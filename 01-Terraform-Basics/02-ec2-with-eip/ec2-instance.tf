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
  region = "us-east-1"
}

#Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"

}

resource "aws_eip" "aws-static-publicip" {

}

resource "aws_eip_association" "eip_attach_to_ec2" {
  instance_id = aws_instance.ec2demo.id
  allocation_id = aws_eip.aws-static-publicip.id
}