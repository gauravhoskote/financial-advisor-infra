



module "client_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = "var.model_arn"
  ai_inference_profile_name = "var.ai_inference_profile_name"
  description = "var.description"
  module_key = "jpmc_fin_advisor_client"
  application_key = "jpmc_fin_advisor"
  environment = var.environment
}