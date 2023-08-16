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



data "aws_acm_certificate" "acm" {
  count = 1
  domain = var.dns_domain
  latest = true
  name = var.dns_domain
  
}


resource "aws_lb" "hog_app_traffic_lb" {
    name = var.name
    internal = var.lb_internal_or_external
    load_balancer_type = var.lb_ip_address_type
    security_groups = var.security_group_ids.security_group_ids
    subnets = var.subnet_ids
    idle_timeout = var.idle_timeout

    enable_deletion_protection = var.enable_deletion

    access_logs {
      bucket = var.access_logs_bucket_ID.id
      prefix = var.access_logs_bucket_prefix
      enabled = true
    }

    tags = {
      Environment = var.env
      Owner = var.owner
      App = var.application_name
    }
  
}

resource "aws_lb_listener" "for_http" {
    load_balancer_arn = aws_lb.this.ARN
    port = "80"
    protocol = "HTTP"
    ssl_policy = "ELBSecurityPolicy-2016-08"
    certificate_arn = data.aws_acm_certificate.acm.arn

    default_action {
      target_group_arn = var.target_group_ARN
      type = "forward"
    }
  
}

resource "aws_lb_listener" "https" {
  count = 1
  load_balancer_arn = aws_lb.hog_app_traffic_lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  
}

resource "aws_lb_listener" "https-acm" {
  count = 1
  load_balancer_arn = aws_lb.hog_app_traffic_lb.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy =  "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.acm.arn

  default_action {
    target_group_arn = var.target_group_ARN
    type = "forward"
  }

}

resource "aws_lib_listener" "https-iam" {
  count = 1 
  load_balancer_arn = aws_lb.hog_app_traffic_lb.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.acm.arn

  default_action {
    target_group_arn = var.target_group_ARN
    type = "forward"
  }
  
}