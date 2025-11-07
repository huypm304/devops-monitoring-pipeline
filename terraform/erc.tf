resource "aws_ecr_repository" "app_repo" {
  name = "devops-project-repo" 

  image_scanning_configuration {
    scan_on_push = true
  }
}