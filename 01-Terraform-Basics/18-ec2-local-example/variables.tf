#Variable for aws region

variable "aws_region" {
  type = string
  description = "AWS Region where we want to create our resources"
  default = "us-east-1"
}

# AWS EC2 type
variable "EC2_Type" {
  type = string
  description = "EC2 Instance type need to define"
  default = "t2.micro"
}

#AWS EC2 AMI ID

variable "EC2_AMI" {
  type = string
  description = "AWS AMI ID need to define"
  default = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
}