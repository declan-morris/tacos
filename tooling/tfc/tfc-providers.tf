resource "tfe_registry_provider" "aws" {
  organization = tfe_organization.test.name

  registry_name = "public"
  namespace     = "hashicorp"
  name          = "aws"
}