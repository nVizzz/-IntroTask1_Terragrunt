include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/route_table?ref=v0.0.23"
}
inputs = {
  cidr_block  = "0.0.0.0/0"
}

dependencies {
  paths = ["../nat_gw", "../igw"]
}