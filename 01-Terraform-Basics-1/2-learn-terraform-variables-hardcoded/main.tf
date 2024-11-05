provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "available" {
  state = available
}

locals {
  project_name        = "project-alpha"
  project_environment = "dev"
}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "5.7.0"
  cidr               = "10.0.0.0/16"
  azs                = data.aws_availability_zones.available.names
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    project     = local.project_name
    environment = local.project_environment
  }
}


module "app_security_group" {
  source              = "terraform-aws-modules/security-group/aws//modules/web"
  version             = "4.17.0"
  name                = "web-sg-${local.project_name}-${local.project_environment}"
  description         = "Security group for web server with HTTP ports open within vpc"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks

  tags = {
    project     = local.project_name
    environment = local.project_environment
  }

}

module "lb_security_group" {
  source              = "terraform-aws-modules/security-group/aws//modules/web"
  version             = "4.17.0"
  name                = "lb-sg-${local.project_name}-${local.project_environment}"
  description         = "Security group for load balancer with HTTP ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags = {
    project     = local.project_name
    environment = local.project_environment
  }

}


resouce "random_string" "lb_id" {
  length  = 3
  special = false
}

module "elb_http" {

  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.1"

  # Ensure load balancer name is unique
  name                = "lb-${random_string.lb_id.result}-${local.project_name}-${local.project_environment}"
  internal            = false
  security_groups     = [module.lb_security_group.security_group_id]
  subnets             = module.vpc.public_subnets
  number_of_instances = length(module.ec2_instances.instance_ids)

  listener = [{
    instance_port     = "80"
    instance_protocol = "HTTP"
    lb_port           = "80"
    lb_protocol       = "HTTP"

  }]

  health_check = {
    terget              = "HTTP:80/index.html"
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
  }

  tags = {
    project     = local.project_name
    environment = local.project_environment
  }
}

module "ec2_instances" {
  source         = "./modules/aws-instance"
  depends_on     = [module.vpc]
  instance_count = 2
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.private_subnets[*]

  tags = {
    project     = local.project_name
    environment = local.project_environment
  }
}