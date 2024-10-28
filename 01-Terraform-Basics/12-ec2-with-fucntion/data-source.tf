data "aws_ami" "amazonami" {
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernal-*-gp2"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = architecture
    values = ["x86_64"]
  }
}