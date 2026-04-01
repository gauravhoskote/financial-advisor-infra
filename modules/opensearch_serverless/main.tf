resource "aws_opensearchserverless_security_policy" "encryption" {
  name        = "${var.collection_name}-enc"
  type        = "encryption"
  description = "Encryption policy for ${var.collection_name}"
  policy = jsonencode({
    Rules = [{
      ResourceType = "collection"
      Resource     = ["collection/${var.collection_name}"]
    }]
    AWSOwnedKey = true
  })
}

resource "aws_opensearchserverless_security_policy" "network" {
  name        = "${var.collection_name}-net"
  type        = "network"
  description = "Network policy for ${var.collection_name}"
  policy = jsonencode([{
    Rules = [
      {
        ResourceType = "collection"
        Resource     = ["collection/${var.collection_name}"]
      },
      {
        ResourceType = "dashboard"
        Resource     = ["collection/${var.collection_name}"]
      }
    ]
    AllowFromPublic = true
  }])
}

resource "aws_opensearchserverless_collection" "collection" {
  name        = var.collection_name
  type        = "VECTORSEARCH"
  description = var.description

  tags = merge(var.tags, {
    application_key = var.application_key
    module_key      = var.module_key
  })

  depends_on = [
    aws_opensearchserverless_security_policy.encryption,
    aws_opensearchserverless_security_policy.network
  ]
}
