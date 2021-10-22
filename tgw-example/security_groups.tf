//Create a security group for each VPC, using count
resource "aws_security_group" "edr_vpc_sg" {
  count       = 3
  name        = "${var.env_prefix}_vpc${count.index}_sg"
  description = "Security Group for VPC${count.index}"

  //Need to understand this:
  vpc_id = element(aws_vpc.edr_vpc.*.id, count.index)
  //

  tags = {
    "Name"    = "${var.env_prefix}_VPC${count.index}_sg"
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

/*

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

*/