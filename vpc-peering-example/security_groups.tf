//Security Group for VPC1
resource "aws_security_group" "edr_vpc_1_sg" {
  name        = "${var.env_prefix}_vpc_1_sg"
  description = "Endpoint Security Group for edr_vpc_1"
  vpc_id      = aws_vpc.edr_vpc_1.id

  tags = {
    "Name"    = "${var.env_prefix}_vpc_1_sg"
    "Creator" = var.built_by
  }

  //No limits on INGRESS traffic for things in the same security group
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  //No limits on EGRESS traffic for things in the same security group
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  //This is required for peered traffic FROM the other (peered) vpc
  ingress {
    description = "Allow traffic FROM the other (peered) vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_2_cidr]
  }

  //This is required for peered traffic FROM the other (peered) vpc
  egress {
    description = "Allow traffic TO the other (peered) vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_2_cidr]
  }

}

//Security Group for VPC2
resource "aws_security_group" "edr_vpc_2_sg" {
  name        = "${var.env_prefix}_vpc_2_sg"
  description = "Endpoint Security Group for edr_vpc_2"
  vpc_id      = aws_vpc.edr_vpc_2.id

  tags = {
    "Name"    = "${var.env_prefix}_vpc_2_sg"
    "Creator" = var.built_by
  }

  //No limits on INGRESS traffic for things in the same security group
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  //No limits on EGRESS traffic for things in the same security group
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  //This is required for peered traffic FROM the other (peered) vpc
  ingress {
    description = "Allow traffic FROM the other (peered) vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_1_cidr]
  }

  //This is required for peered traffic FROM the other (peered) vpc
  egress {
    description = "Allow traffic TO the other (peered) vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_1_cidr]
  }

}