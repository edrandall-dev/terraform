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