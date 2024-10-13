resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-123-xyz"
  provider = aws.prod
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}