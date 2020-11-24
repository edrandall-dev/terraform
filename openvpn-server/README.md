# openvpn-server

This is my first terraform module which I created to instantiate an openvpn-server in either:
 - us-east-1 (N. Virginia)
 - eu-central-1 (Frankfurt)
 - eu-west-1 (Ireland)

 It's pretty simple and I called it with a .tf file like this (for each location - this example is for Frankfurt):

```console
//Defaults are commented
module "frankfurt" {
    source = "../../../modules/openvpn-server"

    #vpc_cidr = "192.168.254.0/28"
    #subnet_cidr = "192.168.254.0/28"

    built_by = "Ed Randall"
    env_prefix = "edr-tf-vpn"
    region = "eu-central-1"
    home_ip = "XX.XX.XX.XX/32"
    instance_type = "t2.small"
    ssh_key_name = "edr-eu-central-1"
    ssh_public_key = "ssh-rsa AAAAB3...hQo5"
}

output "instructions" {
  value = module.frankfurt.next_steps
}
```

Once the environment has been created, the following "next-steps" are shown as an output:

```console
 
1. Connect to ec2 instance as root using the following command:
# ssh -o "StrictHostKeyChecking no" -i edr-${var.region}.pem root@${aws_instance.openvpn_server.public_ip}

2. Connect to ec2 instance again as openvpnas user:
# ssh -o "StrictHostKeyChecking no" -i edr-${var.region}.pem openvpnas@${aws_instance.openvpn_server.public_ip}
# sudo passwd openvpn

3. Visit the admin portal to verify the VPN config"
https://${aws_instance.openvpn_server.public_ip}:943/admin 

4. Visit the user portal to download the connection profile:
https://${aws_instance.openvpn_server.public_ip}:943/ 

```