variable "hog_app_component" {
    description = "COMPONENT OF THE APP"
    type = string
  
}

variable "name" {
    description = "NAME INSTANCE"
    type = string
    default = ""
  
}

variable "engine" {
    description = "Component of system"
    default = "redis"
  
}

variable "aws" {
    description = "Sns Region"
  
}

variable "engine_version" {
    description = "Memcache engine"
    default = "1.5.10"
  
}

variable "subnet_group_name" {
    description = "VPC subnet group"
  
}

variable "sg_ids" {
    description = "Security Group IDs"
    type = list(string)
  
}

variable "dns_domain" {
    description = "DNS Domain"
  
}

variable "dns_zone_id" {
    description = "DNS_ZONE ID"
  
}

variable "maintenance_time" {
    description = "When to performa maintenance"
    default = "sun:00:00-sun:00:30"
}

variable "instance_type" {
    description = "Memory capacity of the nodes"
    default = "cache.t2.micro"
  
}

variable "cloudwatch_group" {
    description = "Cloudwatch group name"
    type = string
  
}

variable "sns_topic" {
    description = "SNS topic name"
    default = ""
  
}

variable "cpu_threshold" {
    description = "Threshold for cpu capacity"
    default = "65"
  
}

variable "database_modification" {
    description = "To apply database change immediately or not"
    default = true
  
}

variable "aws_elasticache_cluster_port" {
    description = "Port number for cluster"
    default = "1211"

  
}

variable "parameter_group_name" {
    description = "The parameter group"
    default = "default.memcached1.5"
  
}

