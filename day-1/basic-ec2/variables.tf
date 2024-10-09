variable "ami" {
 type = string
 default = "ami-078264b8ba71bc45e"
 description = "AWS EC2 AMI"

}

variable "region" {
  type = string
  default = "ap-south-1"
  description = "AWS region"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "AWS EC2 Instance type"
}