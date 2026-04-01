variable "bucket_id" {
  description = "ID of the S3 bucket to upload files into"
  type        = string
}

variable "local_directory" {
  description = "Absolute or relative path to the local directory whose contents will be uploaded"
  type        = string
}

variable "key_prefix" {
  description = "Optional S3 key prefix (folder path) to prepend to each uploaded file, e.g. 'data/'"
  type        = string
  default     = ""
}
