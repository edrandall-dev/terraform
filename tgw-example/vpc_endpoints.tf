resource "aws_vpc_endpoint" "edr_vpce_ssm" {
  count = 3

  vpc_id = element(aws_vpc.edr_vpc.*.id, count.index)


  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    element(aws_security_group.edr_vpc_sg.*.id, count.index)
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc${count.index}_vpce_ssm"
    "Creator" = var.built_by
  }

  subnet_ids = [
    element(aws_subnet.edr_subnet.*.id, count.index)
  ]
}

resource "aws_vpc_endpoint" "edr_vpce_ec2messages" {
  count = 3

  vpc_id = element(aws_vpc.edr_vpc.*.id, count.index)


  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    element(aws_security_group.edr_vpc_sg.*.id, count.index)
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc${count.index}_vpce_ec2messages"
    "Creator" = var.built_by
  }

  subnet_ids = [
    element(aws_subnet.edr_subnet.*.id, count.index)
  ]
}

resource "aws_vpc_endpoint" "edr_vpce_ssmmessages" {
  count = 3

  vpc_id = element(aws_vpc.edr_vpc.*.id, count.index)


  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    element(aws_security_group.edr_vpc_sg.*.id, count.index)
  ]

  private_dns_enabled = true

  tags = {
    "Name"    = "${var.env_prefix}_vpc${count.index}_vpce_ssmmessages"
    "Creator" = var.built_by
  }

  subnet_ids = [
    element(aws_subnet.edr_subnet.*.id, count.index)
  ]
}