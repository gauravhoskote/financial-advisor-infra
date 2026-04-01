locals {
  files = fileset(var.local_directory, "**")
}

resource "aws_s3_object" "upload" {
  for_each = local.files

  bucket = var.bucket_id
  key    = "${var.key_prefix}${each.value}"
  source = "${var.local_directory}/${each.value}"
  etag   = filemd5("${var.local_directory}/${each.value}")
}
