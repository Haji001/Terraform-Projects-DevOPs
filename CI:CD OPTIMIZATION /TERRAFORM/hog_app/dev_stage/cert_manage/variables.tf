variable "domain_name" {
    description = "The name of the domain"
    default = "hog.io"
  
}

variable "aws_region" {
    default = "us-east-1"
  
}

variable "lifecycle" {
    description = "Cert lifecycle"
    default = true
  
}

variable "validation_method" {
    description = "The validation method"
    default = "EMAIL"
  
}

variable "validation_domain" {
    description = "Defaul validation domain"
    default = "hog-app.io"
  
}

variable "validation_ttl" {
    description = "Validation Time-To-Live"
    default = 60
  
}