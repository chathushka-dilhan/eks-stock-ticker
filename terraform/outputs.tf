// Outputs from the root module.

output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster's Kubernetes API."
  value       = module.eks.cluster_endpoint
}

output "msk_bootstrap_brokers_tls" {
  description = "The TLS bootstrap brokers for the MSK cluster."
  value       = module.msk.bootstrap_brokers_tls
}

output "ecr_repository_urls" {
  description = "The URLs of the ECR repositories."
  value       = module.ecr.repository_urls
}

output "websocket_api_endpoint" {
  description = "The endpoint URL for the WebSocket API."
  value       = module.api_gateway.websocket_api_endpoint
}

output "connections_table_name" {
  description = "The name of the DynamoDB table for WebSocket connections."
  value       = module.api_gateway.connections_table_name
}