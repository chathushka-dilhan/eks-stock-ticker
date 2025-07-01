variable "cluster_name" {
  description = "The name of the MSK cluster."
  type        = string
}

variable "kafka_version" {
  description = "The desired Kafka version for the MSK cluster."
  type        = string
}

variable "number_of_broker_nodes" {
  description = "The number of broker nodes in the MSK cluster."
  type        = number
}

variable "broker_instance_type" {
  description = "The instance type for the Kafka brokers."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the MSK cluster will be deployed."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  type        = string
}

variable "private_subnet_ids" {
  description = "A list of the private subnet IDs for the MSK cluster."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}