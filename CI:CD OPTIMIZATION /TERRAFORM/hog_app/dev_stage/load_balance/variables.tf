variable "name" {
    description = "Instance name"
    default = ""
  
}

variable "aws_region" {
    description = "Default region for the lb"
    default = "us-east-1"
  
}

variable "enable_cert_acm" {
    description = "AWS ACM to manager cert"
    default = true
  
}

variable "dns_domain" {
    description = "DNS domain to find certs"
    default = ""
  
}


variable "target_group_ARN" {
    description = "Default Target Group ARN"
}

variable "lb_internal_or_external" {
    description = "Whether loadbalance is internal or not"
    default = false
  
}

variable "subnet_ids" {
    description = "List of subnets IDs"
    type = list(string)
  
}

variable "security_group_ids" {
    description = "List of security group ids"
    type = list()
  
}

variable "access_logs_bucket_ID" {
    description = "Access logs bucket id"
  
}

variable "access_logs_bucket_prefix" {
    description = "Name prefix for access logs"
    default = "traffic_lb_logs"
}

variable "idle_timeout" {
    description = "The idle timeout connection"
    default = 60
}

variable "enable_deletion" {
    default = false
  
}

variable "lb_ip_address_type" {
    description = "The type of address that would be enabled for the loadbalance"
    default = "ipv4"
  
}