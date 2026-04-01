variable "created_by" {}
variable "module_key" {}
variable "application_key" {}
variable "bucket_name" {}
variable "tags"{
    default = {
        key1 = "val1"
    }
}