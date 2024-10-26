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

#AWS EC2 Instance type - List

variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = [ "t2.micro", "t3.micro", "t3a.micro" ]
}

#AWS Ec2 instance type - MAP

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "staging" = "t3.micro"
    "prod" = "t3a.micro"
  }
}
