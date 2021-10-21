resource "aws_security_group" "edr_vpc_1_sg" {
  name        = "${var.env_prefix}_vpc_1_sg"
  description = "Endpoint Security Group for edr_vpc_1"
  vpc_id      = aws_vpc.edr_vpc_1.id

  tags = {
    "Name"    = "${var.env_prefix}_edr_vpc_1_sg"
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

resource "aws_security_group" "edr_vpc_2_sg" {
  name        = "${var.env_prefix}_vpc_2_sg"
  description = "Endpoint Security Group for edr_vpc_2"
  vpc_id      = aws_vpc.edr_vpc_2.id

  tags = {
    "Name"    = "${var.env_prefix}_edr_vpc_2_sg"
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