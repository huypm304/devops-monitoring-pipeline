resource "aws_ecr_repository" "app_repo" {
  name = "devops-project-repo" 
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}