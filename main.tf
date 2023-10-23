locals {
  secrets = {
    for secret in var.secrets : secret.name => secret
  }

  secrets_arn = {
    for secret in local.secrets : secret.name => aws_secretsmanager_secret.secrets[secret.name].arn
  }
}

resource "aws_secretsmanager_secret" "secrets" {
  for_each = local.secrets

  name        = each.key
  description = each.value.description
}

resource "aws_secretsmanager_secret_version" "secrets" {
  for_each = local.secrets

  secret_id     = aws_secretsmanager_secret.secrets[each.key].id
  secret_string = jsonencode(each.value.values)
}
