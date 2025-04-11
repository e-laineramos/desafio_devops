resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "drool-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    ClusterName = var.ecs_cluster_name
  }

  alarm_description = "This metric monitors ecs cpu utilization"
  alarm_actions     = []
}

resource "aws_cloudwatch_metric_alarm" "high_memory" {
  alarm_name          = "drool-high-memory"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    ClusterName = var.ecs_cluster_name
  }

  alarm_description = "This metric monitors ecs memory utilization"
  alarm_actions     = []
}

resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "drool-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "0"

  dimensions = {
    LoadBalancer = var.load_balancer_arn_suffix
    TargetGroup  = var.target_group_arn_suffix
  }

  alarm_description = "This metric monitors unhealthy hosts"
  alarm_actions     = []
}