terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.11.0"
    }
  }

  backend "s3" {
    region = "ap-northeast-1"
    bucket = "tfstate"
    key    = "terraform.tfstate"
  }
}

# will be configurated by environment value
provider "aws" {}
