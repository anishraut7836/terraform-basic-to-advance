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

resource "aws_iam_user" "iam-user" {
  for_each = toset([ "AKumar", "VGupta", "RKM" ])
  name = each.key
}