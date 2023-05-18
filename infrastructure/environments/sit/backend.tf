terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "sit/terraform.tfstate"
    region = "us-west-2"
  }
}