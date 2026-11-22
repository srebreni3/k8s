resource "aws_ecr_repository" "app" {
  for_each             = toset(["cve-backend", "cve-frontend"])
  name                 = each.key
  image_tag_mutability = "MUTABLE"
  force_delete         = true # dev: lets destroy remove repos with images

  image_scanning_configuration {
    scan_on_push = true
  }
}