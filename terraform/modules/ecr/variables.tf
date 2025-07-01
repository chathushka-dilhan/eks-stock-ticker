variable "repository_names" {
  description = "A list of names for the ECR repositories to be created."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}