resource "aws_secretsmanager_secret" "rotation-example" {
  count                               = "${var.create_secret_manager_enabled && var.create_secret ? 1 : 0}"
  name                                = var.name
  description                         = var.description
  kms_key_id                          = var.kms_key_id
  rotation_lambda_arn                 = var.secret_rotation_lambda_arn
  name_prefix                         = var.name_prefix
  policy                              = var.rotation_policy
  recovery_window_in_days             = var.recovery_window_in_days
  replica {
            kms_key_id                = var.replica_kms_key_id
            region                    = var.replica_region
  }
  force_overwrite_replica_secret      = var.force_overwrite_replica_secret

  rotation_rules {
    automatically_after_days          = var.secret_rotation_rules_automatically_after_days
  }
  tags                                = var.tags 
}


resource "aws_secretsmanager_secret_policy" "example" {
  count                               = "${var.create_secret_manager_enabled && var.create_secret_policy ? 1 : 0}"
  secret_arn = var.secret_arn
  policy = var.secret_policy
  block_public_policy = var.block_public_policy 
}
resource "aws_secretsmanager_secret_rotation" "example" {
  count                               = "${var.create_secret_manager_enabled && var.create_secret_rotation ? 1 : 0}"
  secret_id           = var.secret_rotation_secret_id
  rotation_lambda_arn = var.secret_rotation_rotation_lambda_arn

  rotation_rules {
    automatically_after_days = var.rotation_rules_automatically_after_days
  }
}
resource "aws_secretsmanager_secret_version" "example" {
  count                               = "${var.create_secret_manager_enabled && var.create_secret_version ? 1 : 0}"
  secret_id     = var.secret_version_secret_id
  secret_string = var.secret_string
  secret_binary = var.secret_binary
  version_stages = var.version_stages
}