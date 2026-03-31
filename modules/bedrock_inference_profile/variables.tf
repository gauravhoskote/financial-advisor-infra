variable "tags" {
    description = "A map of tags to assign to the resource."
    type        = map(string)
    default     = {}
}

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

variable "application_key" {}
variable "module_key"{}