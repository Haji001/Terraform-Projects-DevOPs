

variable "hog_app_component" {
    description = "COMPONENT OF THE APP"
    type = string
  
}

variable "aws_region" {
    description = "THE REGION FOR THE COMP"
    type = string
  
}

variable "hostname" {
    description = "DNS name"
    default = ""
  
}

variable "dns_domain" {
    description = "DNS DOMAIN"
    type = string
    default = ""
}

variable "dns_zone_id" {
    description = "ROUTE53 DNS ZONE ID"
  
}

variable "dns_time_to_live" {
    description = "DNS RECORDS TTL"
    default = true
  
}

variable "instance_profile" {
    description = ""
    default = ""
  
}

variable "subnet_ids" {
    description = "VPC SUBNET IDs"
    type = list(number)
}

variable "security_group_ids" {
    description = "SECURITY GROUP IDs"
    type = list(number)
  
}

variable "availability_zones" {
    description = "AVAILABILITY ZONES"
    type = list(string)
}


variable "instance_count" {
    description = "NUMBER OF INSTANCES"
    default = 2
  
}

variable "instance_ami" {
    description = "THE INSTANCE AMI ID"
    default = " ami-0c94855ba95c71c99"
  
}

variable "instance_type" {
    description = "THE INSTANCE TYPE"
    default = t3.micro
  
}

variable "key_pair" {
    description = "NAME OF KEYPAIR INSTANCE"
  
}

variable "instance_shutdown_behavior" {
    description = "SHUTDOWN OPTION FOR INSTANCE"
    default = "stop"
  
}

variable "monitor_instance" {
    description = "ENABLE INSTANCE MONITORING."
    default = false
  
}

variable "ebs_volume_type" {
    description = "THE TYPE OF EBS VOLUME TO USE"
    type = string
    default = "gp2"
    validation {
      condition = var.ebs_volume_type== "standard" || var.ebs_volume_type == "gp2" || var.ebs_volume_type == "io1"
      error_message = "INVALID EBS VOLUME TYPE. VALID OPTIONS ARE ONLY: 'standard','gp2', i01', or 'standard'"
    }
  
}

variable "root_volume_size" {
    description = "ROOT VOLUME SIZE"
    default = 8
  
}

variable "volume_discard" {
    description = "DESTROY VOLUME WHEN...."
    default = true 
  
}

variable "create_dns" {
    description = "CREATE DNS RECORDS FOR INSTANCE"
    default = true
  
}

variable "subnet_ids" {
    description = "SUBNET IDs"
    type = list(string)
    default = [] 
  
}

variable "vpc_security_group_ids" {
    description = "LIST OF VPC SECURITY GROUP IDs"
    type = list(string)
    default = []
  
}

variable "instance_hibernation" {
    description = "INSTANCE HIBERNATION"
    type = string
    default = "true"
  
}