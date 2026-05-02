provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "santhosh-bucket-77"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "santhosh-bucket-77"
    Environment = "dev"
  }
}