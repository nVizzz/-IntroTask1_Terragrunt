include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/igw?ref=v0.0.24"
}
inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}

dependencies {
  paths = ["../vpc"]
}
