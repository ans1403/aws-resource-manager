locals {
  cluster_name = "my-ecs-cluster"
  repository_names = [
    "test1",
    "test2",
  ]
}

# ===== ECS =====

resource "aws_ecs_cluster" "main" {
  name = local.cluster_name
}

# ===== ECR =====

resource "aws_ecr_repository" "main" {
  name = [for name in local.repository_names : name]

  image_scanning_configuration {
    scan_on_push = true
  }
}
