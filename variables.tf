##############################################
##EC2-Direct-Variables
##############################################

variable "ami-dev" {}
variable "instance_type-dev" {}

variable "region-dev" {
  type        = string
  default     = ""
  description = "AWS region"
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


#################################
###Module EC2
####################

variable "instance-name" {}

variable "ami-preprod" {
  type        = string
  default     = ""
  description = "AWS EC2 AMI"
}

variable "region-preprod" {
  type        = string
  default     = ""
  description = "AWS region"
}

variable "instance_type-preprod" {
  type        = string
  default     = ""
  description = "AWS EC2 Instance type"
}

