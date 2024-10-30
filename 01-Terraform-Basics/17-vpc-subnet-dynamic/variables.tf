variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "aws_region" {
  default = "ap-south-1"
}

variable "subnet_cidr" {
  type = list
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

