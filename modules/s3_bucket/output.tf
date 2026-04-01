output "bucket_id" {
  value = aws_s3_bucket.bucket_creation.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket_creation.arn
}
