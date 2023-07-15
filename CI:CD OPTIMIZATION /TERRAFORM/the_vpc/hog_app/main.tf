
provider "aws" {
    region = var.aws_region
  
}


module "vpc" {
  
  source  = "terraform-aws-modules/vpc/aws"
  version = "<=5.0.0"

  name = var.app_name

  cidr = var.CIDR
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  database_subnets = var.database_subnets
  elasticache_subnets = var.elasticache_subnets
  azs = var.availability_zones
  create_database_subnet_group = bool
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = false
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = merge(
    {
        "Name" = var.app_name
        "App" = var.app_name
        "Env" = var.env
        "Ownder" = var.owner
       

    }
  )

  public_acl_tags = merge({"type" = "public"}, var.public_subnets_tags)
  private_subnet_tags = merge({"type" = "private"}, var.private_subnet_tags)
  database_subnet_tags = merge({"type" = "db"}, var.database_subnet_tags)
  elasticache_subnet_tags = merge({"type" = "ecs"}, var.elasticache_subnets_tags)
  public_route_table_tags = var.public_route_table_tags
  private_route_table_tags = var.public_route_table_tags
  

}
resource "aws_route53_zone" "Route53 Zone" {
    count = var.enable_route53
    name = var.enable_dns_hostnames

    vpc {
      vpc_id = module.vpc_id
    }
    
  
}
