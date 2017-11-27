provider "aws" {
  region              = "${var.aws_region}"
  allowed_account_ids = "${var.aws_allowed_account_ids}"
}

resource "aws_alb" "cfcorp_alb" {
  name            = "${var.application_prefix}-alb-${var.application_environment}-${var.application_deployment}"
  subnets         = "${var.alb_subnets}"
  security_groups = "${var.alb_security_groups}"
  internal        = "false"

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "aws_lb_target_group" "cfcorp_tg" {
  name     = "${var.application_prefix}-tg-${var.application_environment}-${var.application_deployment}"
  port     = "80"                                                                                        # Required but doesn't really matter
  protocol = "${var.tg_protocol}"
  vpc_id   = "${var.tg_vpc_id}"

  health_check {
    path = "${var.tg_health_check_path}"
  }

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "aws_lb_listener" "cfcorp_listener" {
  load_balancer_arn = "${aws_alb.cfcorp_alb.id}"
  port              = "${var.listener_port}"
  protocol          = "${var.listener_protocol}"
  ssl_policy        = "${var.ssl_policy}"
  certificate_arn   = "${var.listener_certificate_arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.cfcorp_tg.arn}"
    type             = "forward"
  }
}
