variable "model_arn" {
    type = string
}

variable "ai_inference_profile_name" {
    type = string
}

variable "description" {
    default = "Data knights Bedrock Model cost tracking"
    type = string
}
variable "environment" {
    description = "Deployment environment (e.g., dev, staging, prod)"
    type        = string
}

variable "application_key" {}
variable "module_key"{}