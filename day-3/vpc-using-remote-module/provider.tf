provider "aws" {
  alias = "dev"
  region = "eu-west-1"
}


provider "aws" {
  alias = "preprod"
  region = "ap-southeast-1"
}