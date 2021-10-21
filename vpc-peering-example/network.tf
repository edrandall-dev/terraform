//VPC1 and associated subnets

resource "aws_vpc" "edr_vpc_1" {
  cidr_block           = var.vpc_1_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc_1"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_1a" {
  cidr_block        = var.subnet_1a_cidr
  vpc_id            = aws_vpc.edr_vpc_1.id
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_1a"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_1b" {
  cidr_block        = var.subnet_1b_cidr
  vpc_id            = aws_vpc.edr_vpc_1.id
  availability_zone = "${var.region}b"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_1b"
    "Creator" = var.built_by
  }
}

//VPC2 and associated subnets

resource "aws_vpc" "edr_vpc_2" {
  cidr_block           = var.vpc_2_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc_2"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_2a" {
  cidr_block        = var.subnet_2a_cidr
  vpc_id            = aws_vpc.edr_vpc_2.id
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_2a"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_2b" {
  cidr_block        = var.subnet_2b_cidr
  vpc_id            = aws_vpc.edr_vpc_2.id
  availability_zone = "${var.region}b"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_2b"
    "Creator" = var.built_by
  }
}