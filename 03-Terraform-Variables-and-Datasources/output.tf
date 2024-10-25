# Terraform Output Values

#EC2 Instance Public IP

output "instance_publicip" {
  description = "EC2 instance Public IP"
  value = aws_instance.myec2vm.public_ip
}

#EC2 Instance Public DNS
output "name" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm.public_dns
}