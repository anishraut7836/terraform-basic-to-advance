resource "random_pet" "name" {}


resource "aws_instance" "first_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.first-sg.id]
  tags = {
    Name = random_pet.name.id
  }
}

resource "aws_security_group" "first-sg" {
  name = "${random_pet.name.id}-sg"

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}