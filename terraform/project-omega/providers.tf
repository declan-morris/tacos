terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  secret_key = var.aws_secret_key
  access_key = var.aws_access_key
}