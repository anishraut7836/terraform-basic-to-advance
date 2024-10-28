variable "ec2_type" {
  default = "t2.micro"
}

variable "package_name" {
  description = "Provide the package name that need to be install"
  type = string
  default = "httpd"
}