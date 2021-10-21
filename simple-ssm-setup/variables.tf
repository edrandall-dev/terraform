variable "region" {
  default = "eu-north-1"
  type    = string
}

variable "env_prefix" {
  default = "edr_test_env"
  type    = string
}

variable "vpc_cidr" {
  default = "10.101.0.0/16"
  type    = string
}

variable "public_subnet_1_cidr" {
  default = "10.101.1.0/24"
  type    = string
}

variable "public_subnet_2_cidr" {
  default = "10.101.2.0/24"
  type    = string
}

variable "private_subnet_1_cidr" {
  default = "10.101.3.0/24"
  type    = string
}

variable "private_subnet_2_cidr" {
  default = "10.101.4.0/24"
  type    = string
}

variable "built_by" {
  default = "Ed Randall (using terraform)"
  type    = string
}

variable "home_ip" {
  default = "82.21.53.106/32"
  type    = string
}

variable "stockholm_linux_ami" {
  default = "ami-0d15082500b576303"
  type    = string
}

locals {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}