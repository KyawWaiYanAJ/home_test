resource "hcp_hvn" "vault_hvn" {
  hvn_id         = "corhort7"
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.cidr_block
}

resource "hcp_vault_cluster" "vault_cluser" {
  cluster_id = var.cluster_id
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  tier       = var.tier
  public_endpoint = var.public_endpoint
  lifecycle {
    prevent_destroy = false
  }
}