module "my-ec2" {
  source        = "github.com/anishraut7836/terraform-modules/modules/ec2"
  providers = {
    aws = aws.preprod
  }
  ami           = var.ami-preprod
  instance_type = var.instance_type-preprod
  instance-name = var.instance-name
}