output "administrators_iam_group_name" {
  value = aws_iam_group.administrators.name
}

output "developers_iam_group_name" {
  value = aws_iam_group.developers.name
}

output "readonly_iam_group_name" {
  value = aws_iam_group.readonly.name
}
