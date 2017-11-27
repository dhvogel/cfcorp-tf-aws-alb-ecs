provider "aws" {
  region              = "${var.aws_region}"
  allowed_account_ids = "${var.aws_allowed_account_ids}"
}

# random id to keep naming unique in create before destroy scenarios
resource "random_id" "resource_identifier" {
  byte_length = 8
}

resource "aws_launch_configuration" "cfcorp_lc" {
  enable_monitoring    = "${var.asg_monitoring_enabled}"
  iam_instance_profile = "${var.asg_iam_instance_profile}"
  image_id             = "${var.asg_ami_id}"
  instance_type        = "${var.asg_instance_type}"
  key_name             = "${var.asg_key_name}"
  name                 = "${var.application_prefix}-lc-${var.application_environment}-${var.application_deployment}-${random_id.resource_identifier.hex}"
  security_groups      = "${var.asg_security_group_ids}"
  user_data            = "${var.asg_user_data}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "cfcorp_asg" {
  name                 = "${var.application_prefix}-asg-${var.application_environment}-${var.application_deployment}-${random_id.resource_identifier.hex}"
  min_size             = "${var.asg_min_size}"
  max_size             = "${var.asg_max_size}"
  desired_capacity     = "${var.asg_desired_capacity}"
  launch_configuration = "${aws_launch_configuration.cfcorp_lc.name}"
  vpc_zone_identifier  = "${var.asg_instance_subnets}"

  lifecycle {
    create_before_destroy = true
  }
}
