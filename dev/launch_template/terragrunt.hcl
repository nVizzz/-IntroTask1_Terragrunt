include "root" {
  path = find_in_parent_folders()
}

dependency "iam" {
  config_path = "../iam"
}

dependency "key_pair" {
  config_path = "../key_pair"
}

dependency "sg" {
  config_path = "../sg"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/launch_template?ref=v0.0.24"
}
inputs = {
  associate_public_ip_address          = false
  image_id                             = "ami-033b95fb8079dc481"
  instance_initiated_shutdown_behavior = "terminate"
  instance_profile                     = dependency.iam.outputs.instance_profile
  instance_type                        = "t2.micro"
  key_pair                             = dependency.key_pair.outputs.key_pair
  name                                 = "cloudx"
  security_group                       = dependency.sg.outputs.sg_public
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
