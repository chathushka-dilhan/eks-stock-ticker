output "bootstrap_brokers_tls" {
  description = "The TLS bootstrap brokers for the MSK cluster."
  value       = aws_msk_cluster.main.bootstrap_brokers_tls
}

output "zookeeper_connect_string" {
  description = "The Zookeeper connection string for the MSK cluster."
  value       = aws_msk_cluster.main.zookeeper_connect_string
}