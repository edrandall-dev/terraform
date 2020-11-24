variable "region" {
  type = string
}

variable "home_ip" {
  type = string
}

variable "env_prefix" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_cidr" {
  type = string
  default = "192.168.254.0/28"
}

variable "subnet_cidr" {
  type = string 
  default = "192.168.254.0/28" 
}

variable "built_by" {
  type = string  
}

variable "ssh_key_name" {
  type = string
}

variable "ssh_public_key" {
  type = string
}