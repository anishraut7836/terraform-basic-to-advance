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


resource "aws_s3_bucket" "mys3" {
  for_each = {
    "dev" = "dev-s3-bucket-783681"
    "stage" = "stage-s3-bucket-783681"
    "prod" = "prod-s3-bucket-783681"
  }
  bucket = "${each.key}-${each.value}"
  tags = {
    value = each.value
    env = each.key
    s3-bucket-name = "${each.key}-${each.value}"
  }
}
