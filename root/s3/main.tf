provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket using Prefix
resource "aws_s3_bucket" "demo_bucket" {
  bucket_prefix = "nextgen-demo-"

  tags = {
    Name        = "Nextgen-S3-Bucket"
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}

# Enable Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.demo_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Server Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block Public Access
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

//policy
resource "aws_iam_user_policy" "s3_create" {
  name = "allow-s3-create"
  user = "test"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:CreateBucket"]
      Resource = "arn:aws:s3:::*"
    }]
  })
}