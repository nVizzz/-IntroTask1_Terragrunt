include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/vpc?ref=v0.0.23"
}
inputs = {
  vpc_cidr             = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}