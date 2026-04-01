output "index_arn" {
  value = aws_s3vectors_index.index.index_arn
}

output "vector_bucket_arn" {
  value = aws_s3vectors_vector_bucket.bucket.vector_bucket_arn
}
