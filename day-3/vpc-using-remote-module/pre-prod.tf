module "vpc-preprod" {
  source = "github.com/anishraut7836/terraform-modules/modules/vpc"
  providers = {
    aws = aws.preprod
  }
  name = "my-vpc-preprod"
  cidr = "10.0.0.0/16"

  azs             = ["apse1-az1", "apse1-az2", "apse1-az3"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  public_subnets  = ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]

  enable_nat_gateway = false
  #enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "preprod"
  }
}