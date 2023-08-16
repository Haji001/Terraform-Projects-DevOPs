
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

variable "bucket_prefix" {
    description = "Unique prefix names for the bucket"
    default = " "
  
}

variable "buckets" {
    description = "Buckets to create"
    type = map(map(string))
    default = {
      "name" = {
        "name" = "hog_app_bucket"
      }
    }
  
}

variable "force_to_destroy_bucket" {
    description = "Whether or not to destroy bucket if it is not empty"
    default = false
  
}

variable "cors_allow_headers" {
    type = list
    default = ["*"]
  
}

variable "cors_allow_methods" {
  type = list(string)
  default = [ "PUT", "POST" ]
}

variable "cors_allow_requests" {
    type = string
    default = "GET"
    description = "Allow GET requests"
  
}

variable "cors_allow_origins" {
    description = "CORS origin link"
    default = "https://s3-hog_app_bucket.com"

  
}

variable "cors_expose_header" {
    type = list(string)
    default = [ "ETag" ]
  
}

variable "max_age_second" {
    description = "Max amount of time that a response should be considered fresh"
    type = number
    default = 3600
  
}