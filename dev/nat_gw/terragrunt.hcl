include "root" {
  path = find_in_parent_folders()
}

dependency "subnet" {
  config_path = "../subnet"
}

terraform {
  source         = "github.com/nVizzz/IntroTask1_Terraform.git//modules/nat_gw?ref=v0.0.24"
}
inputs = {
  subnets_public = dependency.subnet.outputs.subnets_public
}

dependencies {
  paths = ["../subnet"]
}
