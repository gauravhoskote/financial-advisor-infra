variable "region" {
  description = "aws region"
  default = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  default = "prod"
  type        = string
}