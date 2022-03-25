include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/key_pair?ref=v0.0.24"
}
inputs = {
  name    = "cloudx"
}
