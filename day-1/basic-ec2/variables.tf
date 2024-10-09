variable "ami" {
  type        = string
  default     = "ami-a0cfeed8"
  description = "AWS EC2 AMI"

}

variable "region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "AWS EC2 Instance type"
}