module "client_inf_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = "arn:aws:bedrock:us-east-1::inference-profile/global.anthropic.claude-opus-4-5-20251101-v1:0"
  ai_inference_profile_name = "client-profile"
  description = "Inference profile for financial advisory CLIENT model"
  module_key = "jpmc_fin_advisory_client"
  application_key = "jpmc_fin_advisory"
  environment = var.environment
}


module "advisor_inf_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = "arn:aws:bedrock:us-east-1::inference-profile/global.anthropic.claude-opus-4-5-20251101-v1:0"
  ai_inference_profile_name = "advisor-profile"
  description = "Inference profile for financial advisory ADVISOR model"
  module_key = "jpmc_fin_advisory_advisor"
  application_key = "jpmc_fin_advisory"
  environment = var.environment
}


module "analyst_inf_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = "arn:aws:bedrock:us-east-1::inference-profile/global.anthropic.claude-opus-4-5-20251101-v1:0"
  ai_inference_profile_name = "analyst-profile"
  description = "Inference profile for financial advisory ANALYST model"
  module_key = "jpmc_fin_advisory_analyst"
  application_key = "jpmc_fin_advisory"
  environment = var.environment
}

module "embedding_inf_profile" {
  source = "./modules/bedrock_inference_profile"
  model_arn = var.embedding_model_arn
  ai_inference_profile_name = "embedding-profile"
  description = "Inference profile for financial advisory EMBEDDING model"
  module_key = "jpmc_fin_advisory_embedding"
  application_key = "jpmc_fin_advisory"
  environment = var.environment
}

module "knowledge_base_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "jpmc-fin-advisory-knowledge-base-${var.environment}"
  module_key      = "jpmc_fin_advisory_knowledge_base"
  application_key = "jpmc_fin_advisory"
  created_by      = "terraform"
  tags = {
    environment = var.environment
  }
}

module "knowledge_base_upload" {
  source          = "./modules/s3_upload"
  bucket_id       = module.knowledge_base_bucket.bucket_id
  local_directory = "${path.root}/data_upload/knoweldge_base_articles"
}

module "s3_vectors" {
  source             = "./modules/s3_vectors"
  vector_bucket_name = "jpmc-fin-advisory-vectors-${var.environment}"
  index_name         = "jpmc-fin-advisory-index"
}

module "knowledge_base" {
  source = "./modules/bedrock_knowledge_base"

  knowledge_base_name  = "jpmc-fin-advisory-kb-${var.environment}"
  bucket_arn           = module.knowledge_base_bucket.bucket_arn
  knowledge_base_type  = "VECTOR"
  embedding_model_arn  = var.embedding_model_arn
  s3_vectors_index_arn = module.s3_vectors.index_arn
  application_key      = "jpmc_fin_advisory"
  module_key           = "jpmc_fin_advisory_knowledge_base"
  tags = {
    environment = var.environment
  }
}
