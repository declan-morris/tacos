resource "spacelift_stack" "projects" {
  for_each    = var.projects
  name        = "${each.value.name}-${each.value.workspace}"
  description = "${each.value.name}-${each.value.workspace}"

  space_id = spacelift_space.environments[each.value.workspace].id

  # repository = "<Repository Name>"
  branch       = "main"
  repository   = "tacos"
  project_root = each.value.path

  terraform_smart_sanitization    = true
  terraform_external_state_access = true

  # not really sure how this is supposed to work, but it doesn't seem to be working for me?
  # is it expecting plain text file in repo?
  # import_state      = "test.tfstate"
  # import_state_file = "test"
}

resource "spacelift_context_attachment" "aws_creds" {
  for_each    = var.projects

  context_id = spacelift_context.aws[each.value.workspace].id
  stack_id   = spacelift_stack.projects[each.key].id
  priority   = 0
}