variable "newrelic_api_key_ssm_path" {
  type        = string
  description = "ssm path where to retrieve the nr api key"
}

variable "newrelic_account_id_ssm_path" {
  type        = string
  description = "ssm path where to retrieve the nr account id"
}

variable "role_arn" {
  type        = string
  description = "role arn of the nr integration role"
}

variable "name" {
  type        = string
  description = "cloud integration name"
}
