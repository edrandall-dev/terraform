//Create 3 instances (one in each subnet), using 'count'
resource "aws_instance" "edr_instance" {
  count                       = 3
  ami                         = var.stockholm_linux_ami
  instance_type               = "t3.micro"
  subnet_id                   = element(aws_subnet.edr_subnet.*.id, count.index)
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.edr_ssm_instance_profile.name
  vpc_security_group_ids      = [element(aws_security_group.edr_vpc_sg.*.id, count.index)]

  tags = {
    "Name"    = "${var.env_prefix}_instance_${count.index}a"
    "Creator" = var.built_by
  }
}