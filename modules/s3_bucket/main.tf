resource "aws_s3_bucket" "bucket_creation" {
  bucket = var.bucket_name
  tags = merge(var.tags, {
    application_key = var.application_key
    module_key      = var.module_key
  })
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_access" {
  bucket                  = aws_s3_bucket.bucket_creation.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
