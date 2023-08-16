

variable "app_component" {
    description = "Part/Component of the app"
    default = ""
  
}

variable "app_name" {
    description = "application name"
    default = ""
  
}

variable "aws_region" {
    default = "us-east-1"
    description = "Default region"
  
}

variable "vpc_id" {
    description = "Given VPC ID"
}

variable "app_default_ports" {
    description = "Ports that application listens on"
    type = list(number)
    default = [ 443, 80 ]
  
}

variable "app_protocol" {
    default = "tcp"
    description = "default protocol for app"
    type = ""
  
}

variable "ingress_ports" {
    type = list(number)
    default = []
    description = "Allow traffic from these ports"
  
}

variable "custom_ports" {
    description = "Enable traffic for these specific ports"
    type = list(number)
    default = [  ]
}

variable "custom_protocols" {
    description = "Enable custom protocols for incoming traffic"
    type = list(string)
    default = [ "tcp" ]
  
}

variable "ingress_protocols" {
    type = list(string)
    default = []
  
}

variable "ssh_ports" {
    description = "Ports for SSH"
    type = list(number)
    default = [ 22 ]
  
}

variable "cidr_blocks" {
    type = list(number)
    default = []
    description = "Default CIDR"
}

variable "custom_cidr_blocks" {
    type = list(number)
    default = []
    description = "Custom CIDR blocks"
  
}