include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/launch_template?ref=v0.0.23"
}
inputs = {
  associate_public_ip_address          = false
  image_id                             = "ami-033b95fb8079dc481"
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  name                                 = "cloudx"
  user_data_base64                     = ""
  common_tags = {
    Environment = "Development"
    Terraform   = true
    Project     = "CloudX"
    Owner       = "Roman_Izvozchikov"
  }
}

dependencies {
  paths = ["../iam", "../key_pair", "../sg"]
}
