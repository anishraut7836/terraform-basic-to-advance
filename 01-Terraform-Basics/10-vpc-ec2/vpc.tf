#VPC Details

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-dev"
  }
}

#Subnet Details

resource "aws_subnet" "vpc-dev-public-subnet" {
  vpc_id = aws_vpc.vpc-dev.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "vpc-dev-public-subnet"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
  tags = {
    Name = "vpc-dev-igw"
  }
}

#Route table

resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}


#Route for Route table

resource "aws_route" "vpc-dev-route" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-dev-igw.id
}

#Associate route table with subnet

resource "aws_route_table_association" "vpc-dev-public-route-association" {
  subnet_id = aws_subnet.vpc-dev-public-subnet.id
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
}


#Create security group

resource "aws_security_group" "vpc-dev-sg" {
  name = "vpc-dev-default-sg"
  description = "This is the default security group for vpc"
  vpc_id = aws_vpc.vpc-dev.id

  ingress  {
    description = "Allow port 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all ip and port outboud"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}