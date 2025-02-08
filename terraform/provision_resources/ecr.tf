resource "aws_ecr_repository" "aws-ecr" {
  name = "${var.app_name}-ecr"
  tags = {
    Environment = var.tag-name
  }
}
