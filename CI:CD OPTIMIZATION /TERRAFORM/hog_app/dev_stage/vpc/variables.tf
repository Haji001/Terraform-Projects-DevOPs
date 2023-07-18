
variable "aws_region" {
    description = "REGION FOR ALL RESOURCES"
    type = string
    default = "us-east-1"
  
}

variable "availability_zones" {
    description = "AVAILABILITY ZONES"
  
}

variable "CIDR" {
    description = "THE CIDR BLOCK FOR VPC"
    default = "10.10.0.0/16"
  
}

variable "public_subnets" {
    description = "A LIST OF PUBLIC SUBS"
    type = list(string)
    default = [ "10.10.11.0/24", "10.10.12.0/24"]

  
}

variable "private_subnet" {
    description = "LIST OF PRIVATE SUBS"
    type = list(string)
    default = [ "10.10.1.0/24", "10.10.2.0/24" ]

  
}

variable "enable_nat_gateway" {
    description = "START A SINGLE NAT-GATEWAY FOR EACH PRIVATE SUB NETWORK"
    default = false
    type = string
  
}

variable "elasticache_subnets" {
    description = "ELASTICACHE SUBS"
    type = list(string)
    default = []
}

variable "database_subnet_group" {
    description = "TO CREATE DATABASE SUBNET GROUP"
    default = false
    
  
}