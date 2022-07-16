terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }

  # will be configurated by environment value
  backend "s3" {}
}

# will be configurated by environment value
provider "aws" {}
