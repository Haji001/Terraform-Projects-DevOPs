
variable "application-name" {
    type = string
    description = "This is the name of the applicatiion"
  
}

variable "vpc_name" {
    description = "Name for the VPC"
    type = string
  
}

variable "vpc_cidr" {
    description = "CIDR for VPC"
    type = string
    default = "10.0.0.2"
  
}

variable "vpc_azs" {
    description = "Available zones for VPC"
    type = list(string)
    default = [ "us-east-1", "us-west-2" ]
  
}

variable "vpc_public_subnets" {
    description = "Public subnets for IP"
    type = list(string)
    default = [ "10.0.0.0.1",
    "10.2..2..1" ]
  
}

variable "vpc_enable_nat_gateway" {
    description = "Enable NAT gateway for VPC"
    type = bool
    default = true
  
}


variable "ec2_instance_type" {
    description = "The instance type for the virtual machine"
    type = string
    default = "t2.micro"
  
}

variable "ami" {
    description = "ec2 instand AMI ID"
    type = string
    default = "ami-0c94855ba95c71c99"

}


variable "db_name" {
    description = "The name of the RDS"
    type = string
    default = "default"
  
}

variable "allocated_storage" {

    description = "The amount of storage to allocate to the RDS instance"
    type = number
    default = 5
    
  
}

