resource "aws_iam_role" "kb_role" {
  name = "bedrock-kb-${var.knowledge_base_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "bedrock.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "kb_policy" {
  name = "bedrock-kb-access"
  role = aws_iam_role.kb_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Resource = [
          var.bucket_arn,
          "${var.bucket_arn}/*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = ["bedrock:InvokeModel"]
        Resource = var.embedding_model_arn
      },
      {
        Effect = "Allow"
        Action = [
          "s3vectors:PutVectors",
          "s3vectors:GetVectors",
          "s3vectors:DeleteVectors",
          "s3vectors:QueryVectors"
        ]
        Resource = var.s3_vectors_index_arn
      }
    ]
  })
}

resource "aws_bedrockagent_knowledge_base" "kb" {
  name     = var.knowledge_base_name
  role_arn = aws_iam_role.kb_role.arn

  knowledge_base_configuration {
    type = var.knowledge_base_type
    dynamic "vector_knowledge_base_configuration" {
      for_each = var.knowledge_base_type == "VECTOR" ? [1] : []
      content {
        embedding_model_arn = var.embedding_model_arn
      }
    }
  }

  storage_configuration {
    type = "S3_VECTORS"
    s3_vectors_configuration {
      index_arn = var.s3_vectors_index_arn
    }
  }

  tags = merge(var.tags, {
    application_key = var.application_key
    module_key      = var.module_key
  })
}

resource "aws_bedrockagent_data_source" "s3_source" {
  knowledge_base_id = aws_bedrockagent_knowledge_base.kb.id
  name              = "${var.knowledge_base_name}-s3-source"

  data_source_configuration {
    type = "S3"
    s3_configuration {
      bucket_arn = var.bucket_arn
    }
  }
}
