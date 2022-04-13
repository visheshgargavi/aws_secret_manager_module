#required variable(mandatory)
variable "create_secret_manager_enabled" {
  type = bool
  default = true
  description = "To enable secret manager"
}

variable "create_secret" {
  type = bool
  default = false
  description = "To create secret"
}

variable "create_secret_policy" {
  type = bool
  default = false
  description = "To create secret policy"
}

variable "create_secret_rotation" {
  type = bool
  default = false
  description = "To create secret rotation"
}

variable "create_secret_version" {
  type = bool
  default = false
  description = "To create secret version"
}

#variables for secrets
variable "name" {
  type = string
  default = null
  description = "(Optional) Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@- Conflicts with name_prefix."
}

variable "description" {
  type = string
  default = null
  description = "(Optional) Description of the secret."
}

variable "kms_key_id" {
  type = string
  default = null
  description = "(Optional)ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret."
}

variable "secret_rotation_lambda_arn" {
  type = string
  default = null
  description = "ARN of the Lambda function that can rotate the secret."
}

variable "name_prefix" {
  type = string
  default = null
  description = "Optional) Creates a unique name beginning with the specified prefix. Conflicts with name."
}

variable "rotation_policy" {
  type = any
  default = null
  description = "(Optional) Valid JSON document representing a resource policy. "
}

variable "recovery_window_in_days" {
  type = number
  default = null
  description = "(Optional) Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. The default value is 30."
}

variable "replica_kms_key_id" {
  type = string
  default = null
  description = "(Optional) ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret"
}

variable "replica_region" {
  type = string
  default = null
  description = "(Optional) Configuration block to support secret replication. See details below."
}

variable "force_overwrite_replica_secret" {
  type = bool
  default = null
  description = "(Optional) Accepts boolean value to specify whether to overwrite a secret with the same name in the destination Region."
}

variable "secret_rotation_rules_automatically_after_days" {
  type = number
  default = null
  description = "(Required) Specifies the number of days between automatic scheduled rotations of the secret."
}

variable "tags" {
  type = map
  default = {}
  description = "(Optional) Key-value map of user-defined tags that are attached to the secret."
}

#variable for secret policy

variable "secret_arn" {
  type = string
  default = null
  description = "(Required) Secret ARN"
}

variable "secret_policy" {
  type = any
  default = null
  description = "(Required) Valid JSON document representing a resource policy. "
}

variable "block_public_policy" {
  type = string
  default = null
  description = "(Optional) Makes an optional API call to Zelkova to validate the Resource Policy to prevent broad access to your secret."
}

#variable for secret rotation

variable "secret_rotation_secret_id" {
  type = string
  default = null
  description = "(Required) Specifies the secret to which you want to add a new version."
}

variable "secret_rotation_rotation_lambda_arn" {
  type = string
  default = null
  description = "(Required) Specifies the ARN of the Lambda function that can rotate the secret."
}

variable "rotation_rules_automatically_after_days" {
  type = number
  default = null
  description = "(Required) Specifies the number of days between automatic scheduled rotations of the secret."
}

#variables for secret version

variable "secret_version_secret_id" {
  type = string
  default = null
  description = "(Required) Specifies the secret to which you want to add a new version."
}

variable "secret_string" {
  type = any
  default = null
  description = "(Optional) Specifies text data that you want to encrypt and store in this version of the secret."
}

variable "secret_binary" {
  type = string
  default = null
  description = "(Optional) Specifies binary data that you want to encrypt and store in this version of the secret."
}

variable "version_stages" {
  type = list(string)
  default = []
  description = "(Optional) Specifies a list of staging labels that are attached to this version of the secret."
}