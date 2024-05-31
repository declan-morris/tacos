resource "tfe_project" "environments" {
  for_each = toset(local.workspaces)

  organization = tfe_organization.test.name
  name         = each.key
}

resource "tfe_workspace" "workspaces" {
  for_each     = var.projects
  organization = tfe_organization.test.name

  name       = "${each.value.name}-${each.value.workspace}"
  project_id = tfe_project.environments[each.value.workspace].id

  working_directory     = each.value.path
  allow_destroy_plan    = true
  file_triggers_enabled = false # set this to true once it's looking good

  vcs_repo {
    branch         = "main"
    identifier     = "declan-morris/tacos"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_variable_set" "test" {
  for_each = tfe_workspace.workspaces

  variable_set_id = tfe_variable_set.aws.id
  workspace_id    = each.value.id
}