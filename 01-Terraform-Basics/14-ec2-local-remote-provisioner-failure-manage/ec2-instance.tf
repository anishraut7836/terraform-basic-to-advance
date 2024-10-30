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
    command = "echo ${aws_instance.ec2demo.private_ip}" > private_ip.txt

  }

##Now I am going to install nginx package without internet access
## in this case terraform will give the error and exit without installing package
## but now i am going to user on_failure flag to set if anything fail the don't stop the next steps
# in this case next resource will provision like EC2 and S3 bucket

  provisioner "remote-exec" {
    on_failure = continue
    inline = [  
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]
  }

## Here I am defining the step for uninstall the package when resource get destroy
## whenever i run the terraform destroy command in this it will uninstall the package then it will terminate the resource
## basically we can use this for backup purpose. taking application backup, DB backup etc

  provisioner "remote-exec" {
    when = destroy
    inline = [ 
      "sudo yum remove nano -y"
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