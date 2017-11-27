provider "aws" {
  region              = "${var.aws_region}"
  allowed_account_ids = "${var.aws_allowed_account_ids}"
}

module "asg" {
  source = "./asg"

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
  asg_user_data            = "${data.template_file.cfcorp_ecs.rendered}"
  aws_allowed_account_ids  = "${var.aws_allowed_account_ids}"
  aws_region               = "${var.aws_region}"
}

resource "aws_ecs_cluster" "cfcorp_ecs" {
  name = "${var.application_prefix}-ecs-${var.application_environment}-${var.application_deployment}"
}

data "template_file" "cfcorp_ecs" {
  template = "${var.asg_template_file}"

  vars {
    ecs_cluster = "${aws_ecs_cluster.cfcorp_ecs.name}"
  }
}
