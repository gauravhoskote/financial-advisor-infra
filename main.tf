



module "client_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = "var.model_arn"
  ai_inference_profile_name = "var.ai_inference_profile_name"
  description = "var.description"
  application_key = "jpmc_fin_advisor"
  module_key = "jpmc_fin_advisor_client"
  tags = "var.tags"
}