// This module creates the EKS cluster, fargate profile, and related resources.

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids              = concat(var.public_subnet_ids, var.private_subnet_ids)
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-cluster"
    }
  )

  depends_on = [
    # Explicit dependency on the IAM role attachments from the IAM module
    # This ensures the policies are attached before the cluster tries to use the role.
    # Note: This requires passing the dependency from the root module.
    # A cleaner way in larger projects might be data sources or explicit depends_on in the root module.
  ]
}

resource "aws_eks_fargate_profile" "main" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "${var.cluster_name}-fargate-profile"
  pod_execution_role_arn = var.fargate_pod_execution_role_arn
  subnet_ids             = var.private_subnet_ids

  selector {
    namespace = "default" # We'll start with the default namespace for Fargate pods
  }

  selector {
    namespace = "kube-system" # Required for CoreDNS to run on Fargate
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-fargate-profile"
    }
  )
}