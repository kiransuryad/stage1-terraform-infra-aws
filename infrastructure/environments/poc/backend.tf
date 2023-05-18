terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-009988776"
    key    = "poc/terraform.tfstate"
    region = "us-east-1"
  }
}