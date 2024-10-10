module "my-ec2" {
  source        = "../../modules/ec2-module"
  ami           = var.ami
  instance_type = var.instance_type
  instance-name = var.instance-name
}