terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "uat/terraform.tfstate"
    region = "us-west-2"
  }
}