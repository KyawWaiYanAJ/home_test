variable "cloud_provider" {
  type = string
  description = "Cloud Provider to Deploy the Vault Cluster"
  default = "aws"
}
variable "region" {
  type = string
  description = "The Region of AWS to Deploy the Vault Cluster"
  default = "ap-southeast1"
}

variable "cidr_block" {
  type = string
  description = "the CIDR block of Vault Cluster"
  default = "172.25.16.0/20"
}

variable "cluster_id" {
  type = string
  description = "cluster id of Vault"
  default = "corhort7-vault-cluster"
}

variable "tier" {
  type = string
  description = "Vault CLuster Size"
  default = "starter_small"
}

variable "public_endpoint" {
  type = bool
  description = "Public Endpoint status of Vault Cluster"
  default = true
}