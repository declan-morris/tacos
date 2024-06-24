resource "spacelift_space" "environments" {
  for_each = toset(local.workspaces)

  parent_space_id = "root"

  name        = each.key
  description = "It contains all the resources common to the ${each.key} infrastructure."
}

resource "spacelift_space" "projects" {
  for_each = var.projects

  parent_space_id = spacelift_space.environments[each.value.workspace].id

  name        = each.value.name
  description = "It contains all the resources common to the ${each.key} infrastructure."
}