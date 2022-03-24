include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/asg?ref=v0.0.23"
}
inputs = {
  name     = "cloudx"
  max_size = 6
  min_size = 3
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
