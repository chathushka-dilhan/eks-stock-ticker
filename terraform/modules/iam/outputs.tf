output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  value       = aws_iam_role.eks_cluster.arn
}

output "fargate_pod_execution_role_arn" {
  description = "The ARN of the IAM role for Fargate pod execution."
  value       = aws_iam_role.fargate_pod_execution.arn
}