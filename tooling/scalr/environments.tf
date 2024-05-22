resource "scalr_environment" "environments" {
    for_each = toset(local.workspaces)
    name       = each.key
    cost_estimation_enabled = false
}

resource "scalr_workspace" "workspaces" {
    for_each        = var.projects
    name            = each.value.name
    environment_id  = scalr_environment.environments[each.value.workspace].id
    auto_apply      = true

    working_directory = each.value.path
}