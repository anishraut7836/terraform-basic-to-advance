terraform {
  backend "s3" {
    bucket = "terraform-basic-to-advance-state"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-basic-to-advance-table"
  }
}


