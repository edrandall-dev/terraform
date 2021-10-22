//VPC1 and associated subnet
resource "aws_vpc" "edr_vpc1" {
  cidr_block           = var.vpc1_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc1"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_1a" {
  cidr_block        = var.subnet_1a_cidr
  vpc_id            = aws_vpc.edr_vpc1.id
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_1a"
    "Creator" = var.built_by
  }
}

//VPC2 and associated subnet
resource "aws_vpc" "edr_vpc2" {
  cidr_block           = var.vpc2_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc2"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_2a" {
  cidr_block        = var.subnet_2a_cidr
  vpc_id            = aws_vpc.edr_vpc2.id
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_2a"
    "Creator" = var.built_by
  }
}

//VPC3 and associated subnet
resource "aws_vpc" "edr_vpc3" {
  cidr_block           = var.vpc3_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc3"
    "Creator" = var.built_by
  }
}

resource "aws_subnet" "edr_subnet_3a" {
  cidr_block        = var.subnet_3a_cidr
  vpc_id            = aws_vpc.edr_vpc3.id
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_3a"
    "Creator" = var.built_by
  }
}





/*
//Route Table for VPC1 
resource "aws_route_table" "edr_vpc_1_rt" {
  vpc_id = aws_vpc.edr_vpc_1.id

  route {
    cidr_block                = var.vpc_2_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.edr_vpc_peer.id
  }

  tags = {
    "Name"    = "${var.env_prefix}_vpc_1_rt"
    "Creator" = var.built_by
  }
}

//Route table association for Subnet 1a
resource "aws_route_table_association" "edr_subnet_1a_rt_association" {
  subnet_id      = aws_subnet.edr_subnet_1a.id
  route_table_id = aws_route_table.edr_vpc_1_rt.id
}

//Route table association for Subnet 1b
resource "aws_route_table_association" "edr_subnet_1b_rt_association" {
  subnet_id      = aws_subnet.edr_subnet_1b.id
  route_table_id = aws_route_table.edr_vpc_1_rt.id
}

//Route Table for VPC2
resource "aws_route_table" "edr_vpc_2_rt" {
  vpc_id = aws_vpc.edr_vpc_2.id

  route {
    cidr_block                = var.vpc_1_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.edr_vpc_peer.id
  }

  tags = {
    "Name"    = "${var.env_prefix}_vpc_2_rt"
    "Creator" = var.built_by
  }
}

//Route table association for Subnet 2a
resource "aws_route_table_association" "edr_subnet_2a_rt_association" {
  subnet_id      = aws_subnet.edr_subnet_2a.id
  route_table_id = aws_route_table.edr_vpc_2_rt.id
}

//Route table association for Subnet 2b
resource "aws_route_table_association" "edr_subnet_2b_rt_association" {
  subnet_id      = aws_subnet.edr_subnet_2b.id
  route_table_id = aws_route_table.edr_vpc_2_rt.id
}
*/