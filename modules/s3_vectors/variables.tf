variable "vector_bucket_name" {
  description = "Name of the S3 Vectors vector bucket"
  type        = string
}

variable "index_name" {
  description = "Name of the vector index"
  type        = string
}

variable "dimension" {
  description = "Embedding dimension — must match the embedding model output (Titan Embed Text v2 default: 1024)"
  type        = number
  default     = 1024
}
