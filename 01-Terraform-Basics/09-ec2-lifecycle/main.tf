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

resource "aws_instance" "ec2demo-1" {
  ami           = "ami-06b21ccaeff8cd686" # Amazon Linux in us-east-1, update as per your region
  #ami = data.aws_ami.amazonami.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1a"

  tags = {
    Name = "My-new-ec2"
  }
  lifecycle {
    #Default value is false. terraform first deleting the older resource then creating new but we make changing the policy here.
    create_before_destroy = true  # if this is true the if we are making any changes in this resource then first it create before delete.
  }

}

/*
####Apply the lifecyclt to prevent deletion of resource while running terraform destroy command

#Resource Block
resource "aws_instance" "ec2demo-2" {
  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-2a"

  tags = {
    Name = "My-new-ec2"
  }
  lifecycle {
    #It is help to save the ec2 instance. 
    prevent_destroy = true
  }

}
*/

/*
#ignore the changes if someone made the changes through UI. 

#Resource Block
resource "aws_instance" "ec2demo-3" {
  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-2a"

  tags = {
    Name = "My-new-ec2"
  }
  lifecycle {
  ignore_changes = [ tags, ]  # in this case we are putting tags in exception list. Terraform will not delete any changes if we did though UI.
  }

}

*/