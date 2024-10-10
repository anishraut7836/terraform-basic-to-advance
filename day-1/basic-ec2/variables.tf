variable "ami" {
  type        = string
  default     = ""
  description = "AWS EC2 AMI"
}

variable "region" {
  type        = string
  default     = ""
  description = "AWS region"
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "AWS EC2 Instance type"
}

variable "ingress_port" {
  type = number
  default = null
  description = "AWS Security group inbound port"
}


variable "ingress_protocol" {
  type = string
  default = ""
  description = "Protocol"
}

variable "cidr_blocks" {
  type = list
  default = null
  description = "Inbound CIDR block"
}