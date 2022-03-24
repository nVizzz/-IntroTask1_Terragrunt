remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "introtask1-terragrunt-nvizzz"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.iam_role
  }
  default_tags {
    tags = {
      Name        = var.project_name
      Environment = "Development"
      Terraform   = true
      Project     = "CloudX"
      Owner       = "Roman_Izvozchikov"
    }
  }
}

variable "region" {}
variable "iam_role" {}
variable "project_name" {}

EOF
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 4.3.0"
        }
      }
    }
EOF
}

terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      find_in_parent_folders("common.tfvars")
    ]
  }
}