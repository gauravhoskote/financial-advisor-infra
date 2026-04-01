resource "aws_s3vectors_vector_bucket" "bucket" {
  vector_bucket_name = var.vector_bucket_name
}

resource "aws_s3vectors_index" "index" {
  vector_bucket_name = aws_s3vectors_vector_bucket.bucket.vector_bucket_name
  index_name         = var.index_name
  data_type          = "float32"
  dimension          = var.dimension
  distance_metric    = "cosine"
}
