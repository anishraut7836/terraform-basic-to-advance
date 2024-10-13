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

provider "aws" {
  alias = "preprod"
  region = var.region-preprod
}

provider "aws" {
  alias = "dev"
  region = var.region-dev
  
}

provider "aws" {
  alias = "prod"
  region = "ap-southeast-1"
  
}
provider "random" {}