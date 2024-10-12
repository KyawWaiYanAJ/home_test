data "aws_availability_zone" "azs" {
  state = "available"
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws-master-account"
  role    = "admin-access-role"
}