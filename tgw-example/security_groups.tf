//Security Group for VPC1
resource "aws_security_group" "edr_vpc1_sg" {
  name        = "${var.env_prefix}_vpc1_sg"
  description = "Security Group for VPC1"
  vpc_id      = aws_vpc.edr_vpc1.id

  tags = {
    "Name"    = "${var.env_prefix}_VPC1_sg"
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

//Security Group for VPC2
resource "aws_security_group" "edr_vpc2_sg" {
  name        = "${var.env_prefix}_vpc2_sg"
  description = "Security Group for VPC2"
  vpc_id      = aws_vpc.edr_vpc2.id

  tags = {
    "Name"    = "${var.env_prefix}_VPC2_sg"
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

//Security Group for VPC3
resource "aws_security_group" "edr_vpc3_sg" {
  name        = "${var.env_prefix}_vpc3_sg"
  description = "Security Group for VPC3"
  vpc_id      = aws_vpc.edr_vpc3.id

  tags = {
    "Name"    = "${var.env_prefix}_VPC3_sg"
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