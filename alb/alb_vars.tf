variable "alb_security_groups" {
  description = "Security groups to attach to ALB"
  type        = "list"
}

variable "alb_subnets" {
  description = "Subnets in which ALB will spin up"
  type        = "list"
}

variable "application_deployment" {
  description = "Designated deployment configuration for resource (eg blue/green)"
  type        = "string"
}

variable "application_environment" {
  description = "Environment in which infrastructure will be deployed (eg dev/qa/prod)"
  type        = "string"
}

variable "application_prefix" {
  description = "Prefix unique to application (for resource identification)"
  type        = "string"
}

variable "aws_allowed_account_ids" {
  description = "List of account ids allowed to use this terraform configuration (to prevent accidents)"
  type        = "list"
}

variable "aws_region" {
  description = "Region in which resources will be launched"
  type        = "string"
}

variable "listener_port" {
  description = "Port on which to listen for requests"
  type        = "string"
}

variable "listener_protocol" {
  description = "Protocol to use when clients connect to ALB"
  type        = "string"
}

variable "tg_health_check_path" {
  description = "Path to target group health check"
  type        = "string"
}

variable "tg_protocol" {
  description = "Protocol to use when routing requests to target group"
  type        = "string"
}

variable "tg_vpc_id" {
  description = "ID of VPC in which to create TG"
  type        = "string"
}
