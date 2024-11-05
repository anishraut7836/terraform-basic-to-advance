provider "aws" {
  region = "ap-south-1"
}


###AWS EC2 with hard coded tags

resource "aws_instance" "myec2-1" {
  ami = ""
  instance_type = "t2.micro"
  tags = {
    Name = "myec2-hardcoded"
  }

}
#####################################################################################
##AWS EC2 with locals tags

locals {
  name_suffix = my-ec2-with-locals-value
}

resource "aws_instance" "myec2=2" {
  ami = ""
  instance_type = "t2.micro"
  tags = {
    Name = local.name_suffix
  }

}
######################################################################
## AWS EC2 with variable value

variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "Name of the environment."
  type        = string
  default     = "dev"
}

 variable "resource_tags" {
   description = "Tags to set for all resources"
   type        = map(string)
   default     = { }
 }

locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }
  tags = merge(var.resource_tags, local.required_tags)
}

locals {
  name_suffix = "${var.project_name}-${var.environment}"
}

output "tags" {
  value = local.tags
}


resource "aws_instance" "myec2-3" {
  ami = ""
  instance_type = "t2.micro"
  tags = local.tags

}