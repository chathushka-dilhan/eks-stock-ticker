// Input variables for the root module.

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "realtime-stock-ticker"
}

variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default = {
    Project = "Real-Time Stock Ticker"
    Owner   = "YourName"
  }
}

// VPC Variables
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones for the VPC."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

// EKS Variables
variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "stock-ticker-eks-cluster"
}

variable "kubernetes_version" {
  description = "The desired Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.28"
}

// MSK Variables
variable "kafka_version" {
  description = "The desired Kafka version for the MSK cluster."
  type        = string
  default     = "2.8.1"
}

variable "number_of_broker_nodes" {
  description = "The number of broker nodes in the MSK cluster."
  type        = number
  default     = 3
}

variable "broker_instance_type" {
  description = "The instance type for the Kafka brokers."
  type        = string
  default     = "kafka.t3.small"
}

// ECR Variables
variable "ecr_repository_names" {
  description = "A list of names for the ECR repositories."
  type        = list(string)
  default     = ["stock-price-generator", "websocket-publisher"]
}