resource "aws_instance" "edr_public_instance_1" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_public_subnet_1.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_endpoint_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_edr_public_instance_1"
    "Creator" = var.built_by
  }
}

resource "aws_instance" "edr_public_instance_2" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_public_subnet_1.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_endpoint_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_edr_public_instance_2"
    "Creator" = var.built_by
  }
}

resource "aws_instance" "edr_private_instance_1" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_private_subnet_1.id
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_endpoint_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_edr_private_instance_1"
    "Creator" = var.built_by
  }
}

resource "aws_instance" "edr_private_instance_2" {
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.edr_private_subnet_2.id
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [aws_security_group.edr_endpoint_sg.id]

  tags = {
    "Name"    = "${var.env_prefix}_edr_private_instance_2"
    "Creator" = var.built_by
  }
}