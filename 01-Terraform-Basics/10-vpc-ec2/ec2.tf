resource "aws_instance" "vpc-dev-public-ec2" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = aws_subnet.vpc-dev-public-subnet.id
  vpc_security_group_ids = [aws_security_group.vpc-dev-sg.id]
  #user_data = file("")
  tags = {
    Name = My-ec2-web
  }
}

resource "aws_eip" "myeip" {
  instance = aws_instance.vpc-dev-public-ec2.id
  depends_on = [ aws_internet_gateway.vpc-dev-igw ]
}


variable "ami-id" {
  default = "ami-0533f2ba8a1995cf9"
}


variable "instance-type" {
  default = "t2.micro"
}