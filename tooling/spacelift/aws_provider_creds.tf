resource "spacelift_context" "aws" {
  for_each = toset(local.workspaces)

  name        = "AWS Credentials - ${each.key}"
  description = "Credentials to deploy to AWS in ${each.key}"
  space_id = spacelift_space.environments[each.key].id
}

# vars can be attached to the stack or a context 

resource "spacelift_environment_variable" "access_key" {
  for_each = toset(local.workspaces)

  context_id = spacelift_context.aws[each.key].id
  name       = "AWS_ACCESS_KEY_ID"
  value      = var.aws_access_key
  write_only = false
}

resource "spacelift_environment_variable" "secret_key" {
  for_each = toset(local.workspaces)

  context_id = spacelift_context.aws[each.key].id
  name       = "AWS_SECRET_ACCESS_KEY"
  value      = var.aws_secret_key
  write_only = false
}

