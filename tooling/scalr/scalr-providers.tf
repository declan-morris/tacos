resource "scalr_provider_configuration" "aws" {
  name                   = "aws-dtm"
  export_shell_variables = false
  environments           = ["*"]
  aws {
    account_type     = "regular"
    credentials_type = "access_keys"
    secret_key       = var.aws_secret_key
    access_key       = var.aws_access_key
  }
}