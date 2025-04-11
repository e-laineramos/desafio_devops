output "load_balancer_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.web.arn
}

output "load_balancer_arn_suffix" {
  value = try(split("/", aws_lb.web.arn)[1], null)
}

output "target_group_arn_suffix" {
  value = try(split("/", aws_lb_target_group.web.arn)[1], null)
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.web.dns_name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.web.arn
}

output "ecs_service_name" {
  description = "Nome do serviço ECS"
  value       = aws_ecs_service.web.name
}

output "task_definition_family" {
  description = "Família da task definition"
  value       = aws_ecs_task_definition.web.family
}
