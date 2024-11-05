provider "aws" {
  region = "ap-south-1"
}


resource "aws_db_instance" "database" {
  allocated_storage = 5
  engine = "mysql"
  instance_class = "db.t3.micro"
  username = var.db_username
  password = var.db_password
  db_subnet_group_name = ""
  skip_final_snapshot = true
}

variable "db_username" {
    description = "Database admin username"
    type = string
    sensitive = true
     
}

variable "db_password" {
  description = "Database admin user password"
  type = string
  sensitive = true
}