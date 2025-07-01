// This module creates ECR repositories.

resource "aws_ecr_repository" "main" {
  for_each = toset(var.repository_names)
  name     = each.key

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}