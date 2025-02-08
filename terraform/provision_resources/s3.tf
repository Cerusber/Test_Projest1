resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  tags = {
    Environment = var.tag-name
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket                  = aws_s3_bucket.s3.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}
