resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-logs"

  tags = {
    Environment = var.tag-name
  }
}


resource "aws_s3_bucket" "alb_logs" {
  bucket = "${var.app_name}-alb-logs"
  acl    = "log-delivery-write" # Required for ALB logging

  tags = {
    Environment = var.tag-name
  }
}
