variable "region" {
  description = "aws region"
  default = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  default = "prod"
  type        = string
}

variable "embedding_model_arn" {
  description = "ARN of the Bedrock embedding model"
  type        = string
  default     = "arn:aws:bedrock:us-east-1::foundation-model/amazon.titan-embed-text-v2:0"
}
