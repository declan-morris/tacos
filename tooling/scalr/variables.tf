variable "workspaces" {
    type = map(string)
  default = {
    "dev" = ""
    "test" = ""
    "prod" = ""
  }
}

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

variable "env_data_path" {
    default = "./environments/"
}

locals {
  workspaces = distinct([for k, project in var.projects : project.workspace ])
}

output "workspaces" {
  value = local.workspaces
}

# locals {
#     envdata = yamldecode(join("\n", [ 
#         for env_data in fileset(".","${var.env_data_path}/*.yaml") : file(env_data)
#     ]))
#     workspaces = flatten([ 
#         for each_env in local.envdata : [
#             for workspace in each_env.workspaces : {
#                 env_name = each_env.name
#                 ws_name  = workspace.name
#             }
#         ]
#     ])
# }