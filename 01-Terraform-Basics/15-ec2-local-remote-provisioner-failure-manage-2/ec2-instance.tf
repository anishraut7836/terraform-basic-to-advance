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
    timeout = "1m"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.ec2demo.private_ip} > private_ip.txt"

  }

##Now I am going to install nginx package without internet access
## in this case terraform will give the error and exit without installing package
## in this case all upcoming resouce will fail 
## suppose next we have to create s3 bucket or any ec2 then in this case this will not go for next steps
  provisioner "remote-exec" {
    
    inline = [  
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]
  }

}

resource "aws_instance" "demo-2" {
  instance_type = "t2.micro"
  ami = "ami-0533f2ba8a1995cf9"
}


resource "aws_s3_bucket" "demo-bucket" {
   bucket = "test-bucket-with-provisioner-11"
}