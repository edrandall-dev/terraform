terraform {
  required_version = ">= 0.12"

    backend "s3" {
    bucket = "edrandall-tf-backend"
    key    = "tf-backends/vpc-peering-example"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = var.region
}