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

variable "asg_ami_id" {
  description = "ID of AMI used in asg instances"
  type        = "string"
}

variable "asg_desired_capacity" {
  description = "Desired amount of ec2 instances running within asg"
  type        = "string"
}

variable "asg_iam_instance_profile" {
  description = "Name of IAM instance profile to attach to asg instances"
  type        = "string"
}

variable "asg_instance_type" {
  description = "Type of instance to use for asg instances (should be t2.nano unless I'm balling out)"
  type        = "string"
  default     = "t2.nano"
}

variable "asg_instance_subnets" {
  description = "List of subnet ids in which asg instances should be launched"
  type = "list"
}

variable "asg_key_name" {
  description = "Name of key used for sshing into asg instances"
  type = "string"
}

variable "asg_max_size" {
  description = "Max amount of instances in asg"
  type = "string"
}

variable "asg_min_size" {
  description = "Min amount of instances in asg"
  type = "string"
}

variable "asg_monitoring_enabled" {
  description = "Boolean indicating whether or not to enable detailed instance monitoring"
  type = "string"
}

variable "asg_security_group_ids" {
  description = "List of ids of sgs to attach to asg instances"
  type = "list"
}

variable "asg_user_data" {
  description = "User data to run when launching a new instance"
  type = "string"
}

variable "aws_allowed_account_ids" {
  description = "List of account ids allowed to use this terraform configuration (to prevent accidents)"
  type = "list"
}

variable "aws_region" {
  description = "Region in which resources will be launched"
  type = "string"
}
