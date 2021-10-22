/*
//VPC1 Instance
resource "aws_instance" "edr_instance_1a" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_subnet_1a.id
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_vpc1_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_instance_1a"
    "Creator" = var.built_by
  }
}

//VPC2 Instance
resource "aws_instance" "edr_instance_2a" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_subnet_2a.id
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_vpc2_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_instance_2a"
    "Creator" = var.built_by
  }
}

//VPC3 Instance
resource "aws_instance" "edr_instance_3a" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_subnet_3a.id
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_vpc3_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_instance_3a"
    "Creator" = var.built_by
  }
}

*/