module "networking" {
  source            = "./modules/networking"
  region           = var.region 
  availability_zone = var.availability_zone
}

module "iam" {
  source     = "./modules/iam"
  github_repo = var.github_repo
}

module "ecs" {
  source                 = "./modules/ecs"
  docker_image           = var.docker_image
  vpc_id                 = module.networking.vpc_id
  public_subnet_ids      = module.networking.public_subnet_ids
  security_group_id      = module.networking.security_group_id
  task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  ecs_cluster_name       = "drool-cluster"
  container_port         = 80
  host_port              = 80
}

module "monitoring" {
  source            = "./modules/monitoring"
  ecs_cluster_name  = module.ecs.ecs_cluster_name
  load_balancer_arn = module.ecs.load_balancer_arn
  target_group_arn  = module.ecs.target_group_arn
  load_balancer_arn_suffix = try(module.ecs.load_balancer_arn_suffix, null)
  target_group_arn_suffix  = try(module.ecs.target_group_arn_suffix, null)
}