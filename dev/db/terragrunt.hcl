include "root" {
  path = find_in_parent_folders()
}

dependency "subnet" {
  config_path = "../subnet"
}

dependency "sg" {
  config_path = "../sg"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/db?ref=v0.0.24"
}
inputs = {
  allocated_storage       = 20
  availability_zones      = dependency.subnet.outputs.availability_zones
  azs                     = 3
  backup_retention_period = 10
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  multi_az                = false
  name                    = "cloudx"
  parameter_group_name    = "default.mysql8.0"
  sg_private_db           = dependency.sg.outputs.sg_private_db
  skip_final_snapshot     = true
  storage_type            = "gp2"
  subnets_private_db      = dependency.subnet.outputs.subnets_private_db
}

dependencies {
  paths = ["../iam", "../key_pair", "../sg"]
}
