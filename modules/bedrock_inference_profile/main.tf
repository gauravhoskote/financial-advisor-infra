resource "aws_bedrock_inference_profile" "dk_inference_profile" {
  name        = var.ai_inference_profile_name
  description = var.description
  model_source {
     copy_from = var.model_arn
  }
  tags = var.tags
}