include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/sg?ref=v0.0.23"
}
inputs = {
  public_inbound = {
    http = {
      protocol   = "tcp"
      from_port  = 80
      to_port    = 80
      cidr_block = "0.0.0.0/0"
    }
  }
  public_outbound = {
    all = {
      protocol   = "-1"
      from_port  = 0
      to_port    = 0
      cidr_block = "0.0.0.0/0"
    }
  }
  private_inbound = {
    http = {
      protocol   = "tcp"
      from_port  = 8080
      to_port    = 8080
      cidr_block = "0.0.0.0/0"
    }
  }
  private_outbound = {
    all = {
      protocol   = "-1"
      from_port  = 0
      to_port    = 0
      cidr_block = "0.0.0.0/0"
    }
  }
  private_db_inbound = {
    http = {
      protocol   = "tcp"
      from_port  = 8081
      to_port    = 8081
      cidr_block = "0.0.0.0/0"
    }
  }
  private_db_outbound = {
    all = {
      protocol   = "-1"
      from_port  = 0
      to_port    = 0
      cidr_block = "0.0.0.0/0"
    }
  }
}

dependencies {
  paths = ["../vpc"]
}
