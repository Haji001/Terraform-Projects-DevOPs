terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "<=4.1.1"
    }
  }
  required_version = ">=1.2.0"
}


provider "aws" {
    region = var.aws_region
  
}

data "aws_vpc" "default" {
    default = true
  
}
data "aws_security_group" "default" {
    name = "default"
    vpc_id = data.aws_vpc.default.id
  
}

resource "aws_security_group" "hog_app_sg" {
    name = var.app_name
    vpc_id = var.vpc_id
    description = "Security-group with custom ports"

    ingress {
        from_port = var.ingress_ports
        to_port = var.ingress_ports

        protocol = var.ingress_protocols[0]
        cidr_blocks = var.cidr_blocks
    }

    ingress_custom {
        count = length(var.custom_ports)
        from_port = var.custom_ports[count.index]
        to_port = var.custom_ports[count.index]

        protocol = var.custom_protocols[count.index]
        cidr_blocks = var.custom_cidr_blocks

    }

    ingress_app {
        from_port = var.app_default_ports[0]
        to_port = var.app_default_ports[1]

        protocol = var.app_protocol
        security_groups = var.aws_security_group
    }

    ingress_ssh {
        from_port = var.ssh_ports
        to_port = var.ssh_ports
        security_groups = data.aws_security_group
        protocol = "tcp"
    }

    ingress_in_network {
        count = 1
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }
  
}