resource "random_pet" "name" {}



resource "aws_instance" "web" {
  ami = var.ec2_ami
  instance_type = var.ec2_type
  user_data = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }
}

