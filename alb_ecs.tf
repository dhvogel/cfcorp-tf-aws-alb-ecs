module "cfcorp_ecs" {
  source = "./ecs"

  application_deployment   = "${var.application_deployment}"
  application_environment  = "${var.application_environment}"
  application_prefix       = "${var.application_prefix}"
  asg_ami_id               = "${var.asg_ami_id}"
  asg_desired_capacity     = "${var.asg_desired_capacity}"
  asg_iam_instance_profile = "${var.asg_iam_instance_profile}"
  asg_instance_type        = "${var.asg_instance_type}"
  asg_instance_subnets     = "${var.asg_instance_subnets}"
  asg_key_name             = "${var.asg_key_name}"
  asg_max_size             = "${var.asg_max_size}"
  asg_min_size             = "${var.asg_min_size}"
  asg_monitoring_enabled   = "${var.asg_monitoring_enabled}"
  asg_security_group_ids   = "${var.asg_security_group_ids}"
  asg_template_file        = "${var.asg_template_file}"
  aws_allowed_account_ids  = "${var.aws_allowed_account_ids}"
  aws_region               = "${var.aws_region}"
}

module "cfcorp_alb" {
  source = "./alb"

  alb_security_groups     = "${var.alb_security_groups}"
  alb_subnets             = "${var.alb_subnets}"
  application_deployment  = "${var.application_deployment}"
  application_environment = "${var.application_environment}"
  application_prefix      = "${var.application_prefix}"
  aws_allowed_account_ids = "${var.aws_allowed_account_ids}"
  aws_region              = "${var.aws_region}"
  listener_port           = "${var.listener_port}"
  listener_protocol       = "${var.listener_protocol}"
  tg_health_check_path    = "${var.tg_health_check_path}"
  tg_protocol             = "${var.tg_protocol}"
  tg_vpc_id               = "${var.tg_vpc_id}"
}
