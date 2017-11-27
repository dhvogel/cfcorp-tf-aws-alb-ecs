resource "aws_launch_configuration" "cfcorp_lc" {
  image_id = "ami-b391b9c8"
  instance_type = "t2.nano"
  name = "${var.unique_prefix}-${var.application_tier}-${var.application_environment}-${var.application_deployment}"
  key_name = "cfcorp-2"
  security_groups = ["sg-4032a63c"]
  

  lifecycle {
   create_before_destroy = true
  }
