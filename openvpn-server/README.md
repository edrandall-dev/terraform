# terraform

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