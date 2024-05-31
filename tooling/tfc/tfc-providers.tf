resource "tfe_registry_provider" "aws" {
  organization = tfe_organization.test.name

  registry_name = "public"
  namespace     = "hashicorp"
  name          = "aws"
}

resource "tfe_variable_set" "aws" {
  name         = "AWS variables"
  description  = "Credentials to access AWS"
  global       = false
  organization = tfe_organization.test.name
}

resource "tfe_variable" "aws_access_key" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = var.aws_access_key
  category        = "env"
  description     = "AWS access key"
  variable_set_id = tfe_variable_set.aws.id
  sensitive       = true
}

resource "tfe_variable" "aws_secret_key" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = var.aws_secret_key
  category        = "env"
  description     = "AWS secret key"
  variable_set_id = tfe_variable_set.aws.id
  sensitive       = true
}
