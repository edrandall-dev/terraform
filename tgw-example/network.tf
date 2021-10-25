//Create 3 VPCs (each with a single subnet), using 'count'
resource "aws_vpc" "edr_vpc" {
  count      = 3
  cidr_block = "10.${count.index}.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"    = "${var.env_prefix}_vpc${count.index}"
    "Creator" = var.built_by
  }
}

//Create 3 Subnets (one in each VPC), using 'count'
resource "aws_subnet" "edr_subnet" {
  count      = 3
  cidr_block = "10.${count.index}.0.0/24"

  vpc_id            = element(aws_vpc.edr_vpc.*.id, count.index)
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env_prefix}_subnet_${count.index}a"
    "Creator" = var.built_by
  }
}

resource "aws_default_route_table" "edr_default_route_table_vpc0" {
  default_route_table_id = aws_vpc.edr_vpc[0].default_route_table_id

  route {
      transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
      cidr_block = "10.1.0.0/16"
    }
  
   route {
      transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
      cidr_block = "10.2.0.0/16"
    }

  tags = {
    Name = "Default route table for vpc0"
  }
}

resource "aws_default_route_table" "edr_default_route_table_vpc1" {
  default_route_table_id = aws_vpc.edr_vpc[1].default_route_table_id

  route {
      transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
      cidr_block = "10.0.0.0/16"
    }
  
   route {
      transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
      cidr_block = "10.2.0.0/16"
    }

  tags = {
    Name = "Default route table for vpc1"
  }
}

resource "aws_default_route_table" "edr_default_route_table_vpc2" {
  default_route_table_id = aws_vpc.edr_vpc[2].default_route_table_id

  route {
      transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
      cidr_block = "10.0.0.0/16"
    }
  
   route {
      transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
      cidr_block = "10.1.0.0/16"
    }

  tags = {
    Name = "Default route table for vpc2"
  }
}
