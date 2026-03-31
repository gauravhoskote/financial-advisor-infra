



module "client_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = "us.anthropic.claude-sonnet-4-20250514-v1:0"
  ai_inference_profile_name = "client-profile"
  description = "Inference profile for financial advisor client application"
  module_key = "jpmc_fin_advisor_client"
  application_key = "jpmc_fin_advisor"
  environment = var.environment
}