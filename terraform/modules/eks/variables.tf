variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The desired Kubernetes version for the EKS cluster."
  type        = string
}

variable "eks_cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  type        = string
}

variable "fargate_pod_execution_role_arn" {
  description = "The ARN of the IAM role for Fargate pod execution."
  type        = string
}

variable "public_subnet_ids" {
  description = "A list of the public subnet IDs."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "A list of the private subnet IDs."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}