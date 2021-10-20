resource "aws_iam_role" "edr_ssm_role" {
  name               = "${var.env_prefix}-ssm_role"
  assume_role_policy = local.assume_role_policy
}

resource "aws_iam_instance_profile" "edr_ssm_instance_profile" {
  name = "${var.env_prefix}-ssm-profile"
  role = aws_iam_role.edr_ssm_role.name
}

resource "aws_iam_role_policy_attachment" "edr_ssm_policy_attachment" {
  //count      = length(var.managed_iam_policy)
  role       = aws_iam_role.edr_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}