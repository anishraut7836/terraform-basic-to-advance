provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://15.207.249.182:8200"
  skip_child_token = true
  auth_login {
    path = "auth/approle/login"
    parameters = {
        role_id = "066554f5-3d6c-a7a8-1caf-502b8abb8bc6"
        secret_id = "674423ef-0f82-4740-fdd4-a262125e9d7c"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name = "test-secret"
}

resource "aws_instance" "example" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-with-vault"
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}