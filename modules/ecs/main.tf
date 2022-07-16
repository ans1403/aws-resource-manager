locals {
  cluster_name = "my-ecs-cluster"
  repositories = [
    { name = "test1" },
    { name = "test2" },
  ]
}

# ===== ECS =====

resource "aws_ecs_cluster" "main" {
  name = local.cluster_name
}

# ===== ECR =====

resource "aws_ecr_repository" "main" {
  for_each = { for i in local.repositories : i.name => i }
  name     = each.value.name

  image_scanning_configuration {
    scan_on_push = true
  }
}
