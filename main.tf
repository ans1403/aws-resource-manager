locals {
  ecr = {
    image_name = "test"
  }
}

module "ecr" {
  source     = "./module/ecr"
  image_name = local.ecr.image_name
}
