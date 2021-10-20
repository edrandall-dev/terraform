resource "aws_vpc" "edr_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_1" {
  cidr_block        = var.subnet_1_cidr
  vpc_id            = aws_vpc.edr_vpc.id
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_1"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_2" {
  cidr_block        = var.subnet_2_cidr
  vpc_id            = aws_vpc.edr_vpc.id
  availability_zone = "${var.region}b"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_2"
    "Creator" = var.built_by
  }
}