

resource "aws_secretsmanager_secret" "secret_name" {
  name        = var.secret_name
  description = var.description
  tags        = var.tags
}
