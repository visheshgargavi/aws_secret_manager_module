## Instructions

This module is used to create following AWS resources
- aws_secretsmanager_secret
- aws_secretsmanager_secret_policy
- aws_secretsmanager_secret_rotation
- aws_secretsmanager_secret_version

## Examples
```hcl
module "aws_secret_manager" {
  source = "github.com/visheshgargavi/terraform_module?ref=v0.0.1"
  create_secret = true
  secret_rotation_rules_automatically_after_days = 7
  replica_region = "ap-south-1"
  name = "my-secret"
  create_secret_policy = true
  secret_arn = ""
  secret_policy = "{}"
  create_secret_rotation = true
  secret_rotation_secret_id = ""
  secret_rotation_rotation_lambda_arn = ""
  rotation_rules_automatically_after_days = 30
  create_secret_version = true
  secret_version_secret_id = ""
}
```
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
