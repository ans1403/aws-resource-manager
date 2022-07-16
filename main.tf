locals {
  vpc = {
    cidr_block = "10.0.0.0/16"
  }
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = local.vpc.cidr_block
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.id
}

module "ecs" {
  source = "./modules/ecs"
}
