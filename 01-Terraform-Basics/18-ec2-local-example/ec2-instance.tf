

#Resource Block
resource "aws_instance" "ec2demo" {
  ami           = var.EC2_AMI
  instance_type = var.EC2_Type
  tags = {
    Name = "web-${local.name_suffix}"
  }

}

