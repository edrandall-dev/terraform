variable "region" {
  default = "eu-north-1"
  type    = string
}

variable "env_prefix" {
  default = "edr_tgw_env"
  type    = string
}

variable "vpc_count" {
  default = 3
}

variable "vpc0_cidr" {
  default = "10.100.0.0/16"
  type    = string
}

variable "subnet_0a_cidr" {
  default = "10.100.0.0/24"
  type    = string
}

variable "vpc1_cidr" {
  default = "10.101.0.0/16"
  type    = string
}

variable "subnet_1a_cidr" {
  default = "10.101.0.0/24"
  type    = string
}

variable "vpc2_cidr" {
  default = "10.102.0.0/16"
  type    = string
}

variable "subnet_2_cidr" {
  default = "10.102.0.0/24"
  type    = string
}

variable "built_by" {
  default = "Ed Randall (using terraform)"
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