data "aws_ami" "amazon-linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}



resource "aws_instance" "app" {
  count = var.instance_count
  ami = data.aws_ami.amazon-linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_ids[count.index % length(var.subnet_ids)]
  user_data = <<EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl start httpd
   echo "<html><body><div>Hello, world!</div></body></html>" > /var/www/html/index.html
    EOF

    tags = var.tags
}

