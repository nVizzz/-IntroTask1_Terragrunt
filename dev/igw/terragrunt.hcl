include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/igw?ref=v0.0.23"
}

dependencies {
  paths = ["../vpc"]
}