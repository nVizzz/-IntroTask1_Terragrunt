include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/db?ref=v0.0.23"
}
inputs = {
  allocated_storage       = 20
  azs                     = 3
  backup_retention_period = 10
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  multi_az                = false
  name                    = "cloudx"
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  storage_type            = "gp2"
}

dependencies {
  paths = ["../iam", "../key_pair", "../sg"]
}
