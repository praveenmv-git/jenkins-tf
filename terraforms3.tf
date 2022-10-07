terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34.0"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-123786ww"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
