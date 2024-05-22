variable "projects" {
  type = map(object({
    name = string
    path = string
    workspace = string
  }))
  default = {
    "project-alpha-prod" = {
      name = "project-alpha"
      path = "/terraform/project-alpha"
      workspace = "prod"
    },
    "project-alpha-dev" = {
      name = "project-alpha"
      path = "/terraform/project-alpha"
      workspace = "dev"
    },
    "project-omega-prod" = {
      name = "project-omega"
      path = "/terraform/project-omega"
      workspace = "prod"
    },
    "project-omega-dev" = {
      name = "project-omega"
      path = "/terraform/project-omega"
      workspace = "dev"
    }
  }
}

locals {
  workspaces = distinct([for k, project in var.projects : project.workspace ])
}

output "workspaces" {
  value = local.workspaces
}

variable "aws_access_key" {
  type = string
  description = "AWS access key"
  sensitive = true
}


variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
  sensitive = true
}