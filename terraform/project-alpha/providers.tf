terraform {
  required_version = "<= 1.5.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}