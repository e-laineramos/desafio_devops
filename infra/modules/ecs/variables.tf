variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "task_execution_role_arn" {
  description = "ECS task execution role ARN"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "drool-cluster"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 80
}

variable "host_port" {
  description = "Port the host listens on"
  type        = number
  default     = 80
}