resource "aws_ec2_transit_gateway" "edr-transit-gateway" {
  description = "TGW for test environment, created in Terraform"

  tags = {
    "Name"    = "${var.env_prefix}_TGW"
    "Creator" = var.built_by
  }

}

/*
resource "aws_ec2_transit_gateway_vpc_attachment" "edr_vpc0_attachment" {
  subnet_ids         = [aws_subnet.edr_subnet[0].id]
  transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
  vpc_id             = aws_vpc.edr_vpc[0].id

  tags = {
    "Name"    = "${var.env_prefix}_vpc0_attachment"
    "Creator" = var.built_by
  }
}
*/

//Count version
resource "aws_ec2_transit_gateway_vpc_attachment" "edr_vpc_attachment" {
  count = 3 

  subnet_ids = [
    element(aws_subnet.edr_subnet.*.id, count.index)
  ]

  transit_gateway_id = aws_ec2_transit_gateway.edr-transit-gateway.id
  
  vpc_id= element(aws_vpc.edr_vpc.*.id, count.index)

  tags = {
    "Name"    = "${var.env_prefix}_vpc${count.index}_attachment"
    "Creator" = var.built_by
  }
}