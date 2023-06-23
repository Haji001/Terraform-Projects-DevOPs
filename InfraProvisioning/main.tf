
provider "aws" {
    region = "us-east-1"
  
}


module "VPC" {

    source = "terraform-aws-modules/vpc/aws"
    vversion = "<=3.18.1"


    name = var.vpc_name
    cidr = var.vpc_cidr

    azs = var.vpc_azs
    private_subnets = var.vpc_private_subnets
    enable_nat_gateway = var.vpc_enable_nat_gateway

    tags = {
        Terraform   = "true"
        Environment = "dev"
  }
}




module "ec2" {

    source = "terraform-aws-modules/ec2-instance/aws"
    version = "4.0.4"

    name = "instance-for-app"
    count = 1

    ami = var.ami
    instance_type = var.ec2_instance_type


    vpc_security_default_group_ids = [module.vpc.default_security_group_id]
    subnet_id = module.vpc.private_subnets[0] 
  

    tags = {
        Terraform   = "true"
        Environment = "dev"
  }
}





module "rds" {

    source  = "terraform-aws-modules/rds/aws"
    version = "5.9.0"

    db_name = var.db_name
    allocated_storage = var.allocated_storage
    
    engine = "mysql"
    engine_version = "5.7"

    instance_class = "db.t2.micro"  
    username = "admin"
    password = "123654sasfsa"

    port = 8985 #random number haha
    vpc_security_group_ids = [module.vpc.default_security_group_id]


    tags = {
        Terraform   = "true"
        Environment = "dev"
  }
}

