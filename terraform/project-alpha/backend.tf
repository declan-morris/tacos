
terraform {
  backend "remote" {
    hostname = "dmorris.scalr.io"
    organization = "env-v0ocgk7bskoghdark"

    workspaces {
      name = "project-alpha"
    }
  }
}
