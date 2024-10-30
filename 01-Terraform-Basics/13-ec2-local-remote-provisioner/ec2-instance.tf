##Terraform setting block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Provider block
provider "aws" {
  region = "us-east-1"
}

#Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.vpc-dev-sg.id]
  key_name = "MyAWSKey"
  tags = {
    Name = "Terraform-provisioner-practice"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./MyAWSKey.pem")
    host = self.public_ip
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.ec2demo.private_ip} > private_ip.txt"

  }

  provisioner "remote-exec" {
    inline = [  
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]
  }

}
