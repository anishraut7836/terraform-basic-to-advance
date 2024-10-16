###Source
##https://registry.terraform.io/providers/hashicorp/aws/latest/docs


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

provider "random" {}
