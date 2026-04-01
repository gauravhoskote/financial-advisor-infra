output "knowledge_base_id" {
  value = aws_bedrockagent_knowledge_base.kb.id
}

output "knowledge_base_arn" {
  value = aws_bedrockagent_knowledge_base.kb.arn
}

output "data_source_id" {
  value = aws_bedrockagent_data_source.s3_source.data_source_id
}
