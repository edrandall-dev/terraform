variable "region" {
  default = "eu-north-1"
  type    = string
}
variable "profile" {
  default = "rackspace"
  type    = string
}

variable "env_prefix" {
  default = "edr_peering_env"
  type    = string
}

variable "vpc_1_cidr" {
  default = "10.101.0.0/16"
  type    = string
}

variable "subnet_1a_cidr" {
  default = "10.101.1.0/24"
  type    = string
}

variable "subnet_1b_cidr" {
  default = "10.101.2.0/24"
  type    = string
}

variable "vpc_2_cidr" {
  default = "10.102.0.0/16"
  type    = string
}

variable "subnet_2a_cidr" {
  default = "10.102.1.0/24"
  type    = string
}

variable "subnet_2b_cidr" {
  default = "10.102.2.0/24"
  type    = string
}

variable "built_by" {
  default = "Ed Randall (using terraform)"
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