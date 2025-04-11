variable "ecs_cluster_name" {
  description = "Name of the ECS cluster to monitor"
  type        = string
}

variable "load_balancer_arn" {
  description = "ARN of the load balancer to monitor"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group to monitor"
  type        = string
}

variable "load_balancer_arn_suffix" {
  description = "Suffix of the load balancer ARN"
  type        = string
  default     = null
}

variable "target_group_arn_suffix" {
  description = "Suffix of the target group ARN"
  type        = string
  default     = null
}