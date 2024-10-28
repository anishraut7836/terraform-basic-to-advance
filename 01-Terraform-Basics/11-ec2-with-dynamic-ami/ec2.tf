resource "aws_instance" "ec2" {
  ami = data.aws_ami.amazonami.id
  instance_type = "t2.micro"
  tags = {
    Name = "my-ec2-with-dynamic-ami"
  }
}