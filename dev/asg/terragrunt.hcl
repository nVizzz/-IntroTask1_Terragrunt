include "root" {
  path = find_in_parent_folders()
}

dependency "subnet" {
  config_path = "../subnet"
}

dependency "launch_template" {
  config_path = "../launch_template"
}

dependency "lb" {
  config_path = "../lb"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/asg?ref=v0.0.24"
}
inputs = {
  launch_template     = dependency.launch_template.outputs.launch_template
  lb_target_group_arn = dependency.lb.outputs.lb_target_group_arn
  name                = "cloudx"
  max_size            = 6
  min_size            = 3
  subnets_private     = dependency.subnet.outputs.subnets_private
  tags = {
    Environment = "Development"
    Terraform   = true
    Project     = "CloudX"
    Owner       = "Roman_Izvozchikov"
  }
}

dependencies {
  paths = ["../subnet", "../launch_template", "../lb"]
}
