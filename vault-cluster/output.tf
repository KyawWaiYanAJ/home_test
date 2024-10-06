output "hvn_id" {
  description = "HCP HVN ID"
  value = hcp_hvn.vault_hvn
}
output "vault_id" {
  description = "HCP Vault Cluster ID"
  value = hcp_vault_cluster.vault_cluser.id
}
output "vault_namespace" {
  description = "HCP Vault Cluster Namespace"
  value = hcp_vault_cluster.vault_cluser.namespace
}
output "vault_public_endpoint_url" {
  description = "HCP Vault Cluster vault_public endpoint_url"
  value = hcp_vault_cluster.vault_cluser.vault_public_endpoint_url
}
output "vault_version" {
  description = "HCP Vault Cluster vault_version"
  value = hcp_vault_cluster.vault_cluser.vault_version
}
output "vault_private_endpoint_url" {
  description = "HCP Vault Cluster vault_public endpoint_url"
  value = hcp_vault_cluster.vault_cluser.vault_private_endpoint_url
}