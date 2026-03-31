variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "secret_name" {
  description ="Name of the Secret name (only underscores)"
}

variable "description" {
 description = "It Should contain the Key Names not the values" 
}

variable "module_key" {
  
}

variable "created_by" {
  
}

