#Bucket config
variable "bucket_name" {
  type    = string
  default = "my-team-tf-state"
}

# Default config
variable "tag-name" {
  default = "my-team"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

#ECR image name
variable "app_name" {
  type    = string
  default = "my-app"
}
