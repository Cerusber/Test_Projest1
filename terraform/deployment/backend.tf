terraform {
  backend "s3" {
    bucket = "my-tf-state-deployment"
    key    = "state/terraform_state.tfstate"
    region = "eu-west-1"
  }
}

