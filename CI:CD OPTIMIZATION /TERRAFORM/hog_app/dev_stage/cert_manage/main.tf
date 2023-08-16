

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

resource "aws_acm_certificate" "default" {
  domain_name = var.domain_name
  validation_method = var.validation_method
  

  tags = {
    Environment = var.env
    Ownder = var.owner
    App = var.application_name 
  }

  lifecycle {
    create_before_destroy = var.lifecycle
  }
}