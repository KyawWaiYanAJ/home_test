variable "workspace_name" {
  description = "Workspace Name"
  type = string
  default = "create_vpc"
}
variable "org_name" {
  description = "Organization Name"
  type = string
  default = "Secure_Ops"
}
variable "vault_url" {
  description = "The address of the Vault instance runs will access."
  type = string
  default = "https://SecureOps-public-vault-5bcbfee8.02b80f18.z1.hashicorp.cloud:8200" ### have to change new vault cluster id
}
variable "run_role" {
  description = "TFC_VAULT_RUN_ROLE"
  type = string
  default = "admin-access-role"
}
variable "vault_namespace" {
  description = "TFC_VAULT_NAMESPACE"
  type = string
  default = "admin"
}

variable "aws_region" {
  description = "AWS_REGION"
  type = string
  default = "ap-southeast-1"
}