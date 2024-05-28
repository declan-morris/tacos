resource "tfe_project" "environments" {
  for_each = toset(local.workspaces)

  organization = tfe_organization.test.name
  name         = each.key
}

resource "tfe_workspace" "workspaces" {
  for_each              = var.projects
  organization = tfe_organization.test.name

  name                  = "${each.value.name}-${each.value.workspace}"
  project_id            = tfe_project.environments[each.value.workspace].id
  
  working_directory     = each.value.path
  allow_destroy_plan    = true
  file_triggers_enabled = false # set this to true once it's looking good
}