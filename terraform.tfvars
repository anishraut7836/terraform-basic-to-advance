ami-preprod          = "ami-0dee22c13ea7a9a67"
instance_type-preprod = "t2.micro"
instance-name = "first-ec2-using-module"
region-preprod = "ap-south-1"
##############################################
##EC2-Direct-Variables
##############################################
ami-dev = "ami-a0cfeed8"
instance_type-dev = "t2.micro"
ingress_port = "80"
ingress_protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
region-dev = "us-west-2"