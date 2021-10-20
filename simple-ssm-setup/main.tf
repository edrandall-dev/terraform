terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

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

resource "aws_security_group" "edr_endpoint_sg" {
  name        = "${var.env_prefix}_endpoint_sg"
  description = "Endpoint Security Group for edr_vpc"
  vpc_id      = aws_vpc.edr_vpc.id

  tags = {
    "Name"    = "${var.env_prefix}_edr_endpoint_sg"
    "Creator" = var.built_by
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }
}

resource "aws_instance" "edr_instance_1" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_subnet_1.id
  associate_public_ip_address = false

  iam_instance_profile = aws_iam_instance_profile.edr_ssm_instance_profile.name

  vpc_security_group_ids = [aws_security_group.edr_endpoint_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_edr_instance_1"
    "Creator" = var.built_by
  }
}

resource "aws_instance" "edr_instance_2" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_subnet_2.id
  associate_public_ip_address = false

  iam_instance_profile = aws_iam_instance_profile.edr_ssm_instance_profile.name

  vpc_security_group_ids = [aws_security_group.edr_endpoint_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_edr_instance_2"
    "Creator" = var.built_by
  }
}

resource "aws_vpc_endpoint" "edr_vpce_ssm" {
  vpc_id            = aws_vpc.edr_vpc.id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_endpoint_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}-edr_vpce_ssm"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_1.id,
    aws_subnet.edr_subnet_2.id
  ]
}

resource "aws_vpc_endpoint" "edr_vpce_ec2messages" {
  vpc_id            = aws_vpc.edr_vpc.id
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_endpoint_sg.id,
  ]

  tags = {
    "Name"    = "${var.env_prefix}_edr_vpce_ec2messages"
    "Creator" = var.built_by
  }

  private_dns_enabled = true

  subnet_ids = [
    aws_subnet.edr_subnet_1.id,
    aws_subnet.edr_subnet_2.id
  ]
}

resource "aws_vpc_endpoint" "edr_vpce_ssmmessages" {
  vpc_id            = aws_vpc.edr_vpc.id
  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_endpoint_sg.id,
  ]

  tags = {
    "Name"    = "${var.env_prefix}_edr_vpce_ssmmessages"
    "Creator" = var.built_by
  }

  private_dns_enabled = true

  subnet_ids = [
    aws_subnet.edr_subnet_1.id,
    aws_subnet.edr_subnet_2.id
  ]
}

resource "aws_iam_role" "edr_ssm_role" {
  name               = "${var.env_prefix}-ssm_role"
  assume_role_policy = local.assume_role_policy
}

resource "aws_iam_instance_profile" "edr_ssm_instance_profile" {
  name = "${var.env_prefix}-ssm-profile"
  role = aws_iam_role.edr_ssm_role.name
}

resource "aws_iam_role_policy_attachment" "edr_ssm_policy_attachment" {
  //count      = length(var.managed_iam_policy)
  role       = aws_iam_role.edr_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}