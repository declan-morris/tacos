terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10"
    }
    
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "~> 1.0"
    }
  }
}