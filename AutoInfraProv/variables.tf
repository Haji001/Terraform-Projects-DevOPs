# Automated infrastructure provisioning. 

variable "aws_region" {
    description = "Aws to create servers"
    type = string
    default = "us-east-1"
  
}
# variable "app_repo" {
#     description = "Name of the application repo"
#     type = string
  
# }

# variable "app_branch" {
#     description = "Name of the application branch"
#     default = "master"
#     type = string
# }

variable "bucket_name" {
    description = "The name of the S3 bucket for the app artifacts "
    type = string
  
}

variable "s3_bucket_acl" {
    description = "Access control list (ACL) for the s3 bucket"
    type = string
  
}

variable "ec2_instance_type" {
    description = "value"
    type = string
    default = "t2.micro"
  
}

variable "ec2_ami_id" {
    description = "Instance image ID for the EC2 instance"
    type = string
    default = "ami-0123456789abcdef0"
  
}

variable "ec2_instance_count" {
    description = "Number of EC2 instances to create"
    type = number
    default = 2
  
}



