module "my-ec2" {
  source        = "github.com/anishraut7836/terraform-modules/modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  instance-name = var.instance-name
}