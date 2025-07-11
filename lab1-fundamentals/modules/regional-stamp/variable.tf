variable "region" {
  type = string
  description = "The Azure region where the resources will be deployed."
}

variable "name" {
  type = string
  description = "The name of the environment (e.g., dev, prod)."
}

variable "min_node_count" {
  type = number
  description = "Minimum number of nodes in the environment."
}

variable "max_node_count" {
  type = number
  description = "Maximum number of nodes in the environment."
}