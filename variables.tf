variable "region" {
  description = "aws region"
  default = "us-east-1"
}

variable "pwave_bucket" {
  description = "Name of the pwave S3 Bucket"
  default = ""
}

variable "context_bucket" {
  description = "Name of the S3 Bucket "
  default = "uopx-prod-apps-001-context"
}

variable "admin_bucket" {
  description = "Name of the S3 Bucket "
  default = "uopx-prod-dl-admin"
}

variable "ams_bucket" {
  description = "Name of the S3 Bucket "
  default = "uopx-prod-apps-001-ams"
}

variable "enviornment" {
  description = "Name of the Enviornment i.e Prod or Nonprod"
  default = "prod"
}

variable "permissions_boundary" {
  default = ""
}

variable "team_email" {
  default = "gaurav.hoskote@gmail.com"
}

