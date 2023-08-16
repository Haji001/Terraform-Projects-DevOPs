terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "<=4.1.1"
      }
    }
    required_version = ">1.2.0"
  
}

provider "aws" {
    region = var.aws_region
  
}

resource "aws_s3_bucket" "dev_hog_app_bucket" {
    bucket = var.buckets
}



resource "aws_s3_bucket_cors_configuration" "dev_cors_bucket" {
    bucket = aws_s3_bucket.dev_hog_app_bucket.id

    cors_rule {
      allowed_headers = var.cors_allow_headers
      allowed_methods = var.cors_allow_methods
      allowed_origins = var.cors_allow_origins
      expose_headers = var.cors_expose_header
      max_age_seconds = var.max_age_second
    }
    

    cors_rule {
      allowed_methods = var.cors_allow_requests
      allowed_origins = ["*"]
    }

  
}