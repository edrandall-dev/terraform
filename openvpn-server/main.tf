terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpn_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name"    = "${var.env_prefix}-vpc"
    "Creator" = "var.built_by"
  }
}

resource "aws_subnet" "vpn_subnet" {
  cidr_block = var.subnet_cidr
  vpc_id     = aws_vpc.vpn_vpc.id

  tags = {
    "Name"    = "${var.env_prefix}-subnet"
    "Creator" = "var.built_by"
  }
}

resource "aws_internet_gateway" "vpn_igw" {
  vpc_id = aws_vpc.vpn_vpc.id
}

resource "aws_route_table" "vpn_rt" {
  vpc_id = aws_vpc.vpn_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpn_igw.id
  }

  tags = {
    Name = "${var.env_prefix}-rt"
    Creator = "var.built_by"
  }
}

resource "aws_route_table_association" "vpn_rta" {
  subnet_id      = aws_subnet.vpn_subnet.id
  route_table_id = aws_route_table.vpn_rt.id
}

resource "aws_security_group" "vpn_sg" {
  name        = "${var.env_prefix}-sg"
  description = "Allow SSH inbound from home_ip"
  vpc_id      = aws_vpc.vpn_vpc.id

  ingress {
    description = "SSH from home_ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.home_ip]
  }

  ingress {
    description = "Admin Port from home_ip"
    from_port   = 943
    to_port     = 943
    protocol    = "tcp"
    cidr_blocks = [var.home_ip]
  }

  ingress {
    description = "OpenVPN Listening Port from Home"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.home_ip]
  }

 // ICMP Ping from everywhere
 // ingress {
 //   from_port   = 8
 //   to_port     = 0
 //   protocol    = "icmp"
 //   cidr_blocks = ["0.0.0.0/0"]
 // }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-sg"
  }
}

data "aws_ami" "openvpn_ami" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image*"]
  }

  filter {
    name   = "product-code"
    values = ["f2ew2wrz425a1jagnifd02u5t"]
  }
}

resource "aws_instance" "openvpn_server" {
  depends_on                  = [aws_internet_gateway.vpn_igw]
  ami                         = data.aws_ami.openvpn_ami.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpn_subnet.id
  key_name                    = "edr-${var.region}"
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.vpn_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}-server"
    "Creator" = "var.built_by"
  }
}

resource "aws_key_pair" "vpn_key" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_public_key
}




