variable "collection_name" {
  description = "Name of the OpenSearch Serverless collection"
  type        = string
}

variable "description" {
  description = "Description of the collection"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vector_index_name" {
  description = "Name of the vector index to create inside the collection"
  type        = string
}

variable "application_key" {}
variable "module_key" {}

variable "tags" {
  type    = map(string)
  default = {}
}
