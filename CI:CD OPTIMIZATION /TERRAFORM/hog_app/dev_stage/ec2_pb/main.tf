

provider "aws" {
    region = var.aws_region

    default_tags {
      tags = {
        ec2_private = "ec2_private_instance"
      }
    }
  
}


module "ec2_instances" {
    source = "terraform-aws-modules/ec2-instance/aws"

    name = var.application_name
    instance_type = var.instance_type
    

    key_name = var.key_pair
    
    vpc_security_group_ids = var.vpc_security_group_ids
    iam_instance_profile = var.instance_profile

    ebs_optimized = var.ebs_volume_type
    monitoring = var.monitor_instance

    subnet_id = var.subnet_ids
    instance_initiated_shutdown_behavior = var.instance_shutdown_behavior

    associate_public_ip_address = true
    create_iam_instance_profile = true

    hibernation = var.instance_hibernation
    disable_api_stop = true

    root_block_size = [{
        volume_size = var.volume_size
        delete_on_termination = var.volume_discard
    }]

module "records" {
    source = "terraform-aws-modules/route53/aws//modules/records"
    version = "~> 2.0"
    count = 1
    type = "A"
    ttl = var.dns_time_to_live

    zone_name = var.dns_zone_id
    records = var.module.ec2_instances


  
}
}

resource "aws_eip" "this" {
    count = var.assign_elastic_ip ? 1 : 0
    instance = aws_instnace.this[0].id
    vpc = true
  
}

resource "aws_route53_health_check" "this" {
    count = var.create_dns && var.dns_health_check ? 1 : 0

    fqdn = true
    port = var.dns_port_health
    type = var.route53_health_check_type

    tags = {
      name = "${var.app_name}-health-check"
    }
  
}
tags = merge(
  
    { 
        "app" == var.application_name
        "env" == var.env
        "owner" == var.owner
    }
)

volume_tags = merge (
    {
        "Name" == var.app_name
        "Env" == var.env
        "Owner" == var.owner
    }
)