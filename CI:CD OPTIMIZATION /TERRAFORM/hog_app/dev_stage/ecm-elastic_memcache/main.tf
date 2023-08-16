terraform {
  required_providers {
    aws = {
        source = "hashipcorp/aws"
        version = "<=4.1.1"
    }
  }
  required_version = ">=1.2.0"
}

resource "sns_topic" "this" {
    name = var.sns_topic
  
}

resource "aws_elasticache_cluster" "this" {
    cluster_id = var.name
    engine = var.engine
    node_type = var.instance_type
    num_cache_nodes = 2
    parameter_group_name = var.parameter_group_name
    port = var.aws_elasticache_cluster_port

    subnet_group_name = var.subnet_group_name
    security_group_ids = var.sg_ids

    apply_immediately = var.database_modification
    availability_zone = var.dns_zone_id


    log_delivery_configuration {
      destination = var.cloudwatch_group
      destination_type = "cloudwatch-logs"
      log_format = "type"
      log_type = "slow-logs"
    }


  
}

resource "aws_cloudwatch_metric_alarm" "Memcache_CPU" {
    alarm_name = "${var.name}-${var.engine}cluster_memory"
    alarm_description = "${var.engine} memory check alarm"
    comparison_operator = "Above threshold"
    evaluation_periods = "2"
    memtric_name = "CPUUtilization"
    namespace = "AWS/Elasticache"
    period = "300"

    threshold = var.cpu_threshold

    dimensions = {
        CacheClusterID = aws_elasticache_cluster.this.id
    }

    alarm_actions = [sns.topic.this.arn]
    
  
}

resource "aws_route53_record" "this" {
    zone_id = var.dns_zone_id
    name = "${var.name}.${var.dns_domain}"
    type = "CNAME"
    ttl = "60"
    records = [aws.aws_elasticache_cluster.this.aws_service_endpoint_ec2]
  
}

tags = merge(
  
    { 
        "app" == var.application_name 
        "env" == var.env
        "owner" == var.owner
    }
)
