include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "subnet" {
  config_path = "../subnet"
}

dependency "igw" {
  config_path = "../igw"
}

dependency "nat_gw" {
  config_path = "../nat_gw"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/route_table?ref=v0.0.24"
}
inputs = {
  availability_zones = dependency.subnet.outputs.availability_zones
  cidr_block  = "0.0.0.0/0"
  igw_id = dependency.igw.outputs.igw_id
  nat_gw = dependency.nat_gw.outputs.nat_gw
  subnets_public = dependency.subnet.outputs.subnets_public
  subnets_private = dependency.subnet.outputs.subnets_private
  vpc_id = dependency.vpc.outputs.vpc_id
}

dependencies {
  paths = ["../nat_gw", "../igw"]
}