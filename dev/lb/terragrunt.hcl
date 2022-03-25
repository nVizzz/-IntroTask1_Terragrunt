include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "subnet" {
  config_path = "../subnet"
}

dependency "sg" {
  config_path = "../sg"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/lb?ref=v0.0.24"
}
inputs = {
  name                       = "cloudx"
  lb_internal                = false
  lb_type                    = "application"
  enable_deletion_protection = false
  lb_listener_port           = 80
  lb_listener_protocol       = "HTTP"
  sg_lb                      = dependency.sg.outputs.sg_public
  subnets_public             = dependency.subnet.outputs.subnets_public
  target_group_port          = 80
  target_group_protocol      = "HTTP"
  vpc_id                     = dependency.vpc.outputs.vpc_id
}

dependencies {
  paths = ["../subnet", "../sg"]
}
