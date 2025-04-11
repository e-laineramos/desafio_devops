terraform {
  backend "s3" {
    bucket = "drool-tf-state-bucket"
    key    = "drool/infra/terraform.tfstate"
    region = "us-east-1"
  }
}

