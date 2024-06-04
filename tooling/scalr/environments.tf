resource "scalr_environment" "environments" {
    for_each = toset(local.workspaces)
    name       = each.key
    cost_estimation_enabled = false
}

resource "scalr_vcs_provider" "github" {
  name       = "dtm-github"
  vcs_type   = "github"
  token      = var.github_token
}

resource "scalr_workspace" "workspaces" {
    for_each        = var.projects
    name            = each.value.name
    environment_id  = scalr_environment.environments[each.value.workspace].id
    auto_apply      = false

    working_directory = each.value.path
    trigger_patterns = each.value.path

    vcs_provider_id  = scalr_vcs_provider.github.id
    vcs_repo {
        identifier   = "declan-morris/tacos"
        branch       = "main"
    }

    provider_configuration {
        id = scalr_provider_configuration.aws.id
    }
}

resource "scalr_workspace_run_schedule" "drift_detection" {
  for_each = scalr_workspace.workspaces
  workspace_id     = each.value.id
  apply_schedule   = "25 13 * * *"
  # apply_schedule   = "0 7 * * *"
}