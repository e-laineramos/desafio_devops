output "website_url" {
  description = "URL do site"
  value       = "http://${module.ecs.load_balancer_dns}"
}

output "github_actions_access_key" {
  value     = module.iam.github_actions_access_key
  sensitive = true
}

output "github_actions_secret_key" {
  value     = module.iam.github_actions_secret_key
  sensitive = true
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}

output "task_definition_family" {
  value = module.ecs.task_definition_family
}
