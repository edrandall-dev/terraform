data "aws_ami" "latest_amzn_linux2" {
  most_recent = true
  owners = ["amazon"]

  filter {
      name   = "name"
      values = ["amzn2-ami-hvm-2*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
  filter {
    name = "root-device-type"
    values = ["ebs"]    
  }

  filter {
    name = "is-public"
    values = ["true"]
  }

  filter {
    name = "ena-support"
    values = ["true"]
  }
}


output "ami_id" {
  value = data.aws_ami.latest_amzn_linux2.id  
}

output "ami_location" {
  value = data.aws_ami.latest_amzn_linux2.image_location
}

output "ami_platform" {
  value = data.aws_ami.latest_amzn_linux2.platform_details
}

output "ami_description" {
  value = data.aws_ami.latest_amzn_linux2.description
}