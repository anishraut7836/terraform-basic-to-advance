resource "aws_instance" "ec2" {
  ami = data.aws_ami.amazonami.id
  instance_type = var.ec2_type
  user_data = templatefile("user_data.tmpl", {package_name = var.package_name})
  vpc_security_group_ids = [aws_security_group.vpc-dev-sg.id]
  tags = {
    Name = "my-ec2-with-function"
  }
}