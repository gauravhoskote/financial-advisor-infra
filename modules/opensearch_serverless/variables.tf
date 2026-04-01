variable "collection_name" {
  description = "Name of the OpenSearch Serverless collection"
  type        = string
}

variable "description" {
  description = "Description of the collection"
  type        = string
  default     = ""
}

variable "application_key" {}
variable "module_key" {}

variable "tags" {
  type    = map(string)
  default = {}
}
