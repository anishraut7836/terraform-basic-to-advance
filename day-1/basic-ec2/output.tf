output "domain-name" {
  value = aws_instance.first_ec2.public_dns
}

output "application-url" {
  value = "${aws_instance.first_ec2.public_dns}/index.php"
}

output "public_ip" {
  value = aws_instance.first_ec2.public_ip
}