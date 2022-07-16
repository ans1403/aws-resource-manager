locals {
  vpc = {
    cidr_block = "10.0.0.0/16"
  }
}

module "iam" {
  source = "./module/iam"
}

module "vpc" {
  source     = "./module/vpc"
  cidr_block = local.vpc.cidr_block
}

module "security_group" {
  source = "./module/security_group"
  vpc_id = module.vpc.id
}

module "ecs" {
  source = "./module/ecs"
}
