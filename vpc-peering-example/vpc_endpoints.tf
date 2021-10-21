//SSM endpoints for VPC1
resource "aws_vpc_endpoint" "edr_vpc_1_vpce_ssm" {
  vpc_id            = aws_vpc.edr_vpc_1.id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_vpc_1_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc_1_vpce_ssm"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_1a.id,
    aws_subnet.edr_subnet_1b.id
  ]
}

resource "aws_vpc_endpoint" "edr_vpc_1_vpce_ec2messages" {
  vpc_id            = aws_vpc.edr_vpc_1.id
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.edr_vpc_1_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc_1_vpce_ec2messages"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_1a.id,
    aws_subnet.edr_subnet_1b.id
  ]

}

resource "aws_vpc_endpoint" "edr_vpc_1_vpce_ssmmessages" {
  vpc_id            = aws_vpc.edr_vpc_1.id
  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_vpc_1_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc_1_vpce_ssmmessages"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_1a.id,
    aws_subnet.edr_subnet_1b.id
  ]
}

//SSM endpoints for VPC2
resource "aws_vpc_endpoint" "edr_vpc_2_vpce_ssm" {
  vpc_id            = aws_vpc.edr_vpc_2.id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_vpc_2_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc_2_vpce_ssm"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_2a.id,
    aws_subnet.edr_subnet_2b.id
  ]
}

resource "aws_vpc_endpoint" "edr_vpc_2_vpce_ec2messages" {
  vpc_id            = aws_vpc.edr_vpc_2.id
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.edr_vpc_2_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc_2_vpce_ec2messages"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_2a.id,
    aws_subnet.edr_subnet_2b.id
  ]

}

resource "aws_vpc_endpoint" "edr_vpc_2_vpce_ssmmessages" {
  vpc_id            = aws_vpc.edr_vpc_2.id
  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.edr_vpc_2_sg.id,
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc_2_vpce_ssmmessages"
    "Creator" = var.built_by
  }

  subnet_ids = [
    aws_subnet.edr_subnet_2a.id,
    aws_subnet.edr_subnet_2b.id
  ]
}