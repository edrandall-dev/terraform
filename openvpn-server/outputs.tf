output "aws_ami_id" {
  value = data.aws_ami.openvpn_ami.id
}

output "aws_ami_description" {
  value = data.aws_ami.openvpn_ami.description
}

output "aws_instance_ip" {
  value = aws_instance.openvpn_server.public_ip
}

output "next_steps" {
  value = <<EOM


    Next Steps
    ==========

    1. Connect to ec2 instance as root using the following command:
    # ssh -o "StrictHostKeyChecking no" -i edr-${var.region}.pem root@${aws_instance.openvpn_server.public_ip}

    2. Connect to ec2 instance again as openvpnas user:
    # ssh -o "StrictHostKeyChecking no" -i edr-${var.region}.pem openvpnas@${aws_instance.openvpn_server.public_ip}
    # sudo passwd openvpn

    3. Visit the admin portal to verify the VPN config"
    https://${aws_instance.openvpn_server.public_ip}:943/admin 

    4. Visit the user portal to download the connection profile:
    https://${aws_instance.openvpn_server.public_ip}:943/ 

 EOM
}