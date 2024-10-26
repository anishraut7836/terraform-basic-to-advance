#input variables

#AWS Region
variable "aws_region" {
  description = "Region in which aws resources to be created"
  type        = string
  default     = "us-east-1"
}

#AWS EC2 Instance type

variable "instance_type" {
  description = "AWS EC2 Instance type"
  type        = string
  default     = "t2.micro"

}

#AWS EC2 keypair

variable "instance_keypair" {
  description = "AWS EC2 key pair that need to be associated with EC2 instance"
  type        = string
  default     = "MyAWSKey"
}


