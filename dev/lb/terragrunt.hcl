include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/lb?ref=v0.0.23"
}
inputs = {
  name                       = "cloudx"
  lb_internal                = false
  lb_type                    = "application"
  enable_deletion_protection = false
  lb_listener_port           = 80
  lb_listener_protocol       = "HTTP"
  target_group_port          = 80
  target_group_protocol      = "HTTP"
}

dependencies {
  paths = ["../subnet", "../sg"]
}
