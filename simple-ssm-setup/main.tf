terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket  = "edrandall-tf-backend"
    key     = "tf-backends/simple-ssm-setup"
    region  = "eu-north-1"
    profile = "rackspace"
  }
}

provider "aws" {
  region  = var.region
  profile = "rackspace"
}