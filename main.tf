locals {
  vpc = {
    cidr_block = "10.0.0.0/16"
  }
  ecr = {
    image_name = "test"
  }
}

module "vpc" {
  source     = "./module/vpc"
  cidr_block = local.vpc.cidr_block
}

module "security_group" {
  source = "./module/security_group"
  vpc_id = module.vpc.id
}

module "ecr" {
  source     = "./module/ecr"
  image_name = local.ecr.image_name
}
