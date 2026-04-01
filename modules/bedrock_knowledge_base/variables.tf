variable "knowledge_base_name" {
  description = "Name of the Bedrock Knowledge Base"
  type        = string
}

variable "knowledge_base_type" {
  description = "Type of knowledge base: VECTOR or HYBRID"
  type        = string
  default     = "VECTOR"
  validation {
    condition     = contains(["VECTOR", "HYBRID"], var.knowledge_base_type)
    error_message = "knowledge_base_type must be either VECTOR or HYBRID"
  }
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket to use as the data source"
  type        = string
}

variable "embedding_model_arn" {
  description = "ARN of the Bedrock embedding model (e.g. Titan Embed Text v2)"
  type        = string
}

variable "s3_vectors_index_arn" {
  description = "ARN of the S3 Vectors index used as the vector store"
  type        = string
}

variable "application_key" {}
variable "module_key" {}

variable "tags" {
  type    = map(string)
  default = {}
}
