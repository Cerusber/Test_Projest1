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

#RDS config
variable "db-username" {
  type    = string
  default = "jaroslav" #move to ssm
}


variable "db-password" {
  type    = string
  default = "12345" #move to ssm
}

variable "database_name" {
  type    = string
  default = "myappdb"
}
