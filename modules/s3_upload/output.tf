output "uploaded_keys" {
  description = "S3 keys of all uploaded objects"
  value       = [for obj in aws_s3_object.upload : obj.key]
}
