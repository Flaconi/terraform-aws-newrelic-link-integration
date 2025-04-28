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

variable "integrations" {
  type = object({
    billing = optional(object({
      metrics_polling_interval = optional(number, 3600)
    }))
    health = optional(object({
      metrics_polling_interval = optional(number, 600)
    }))
    elasticbeanstalk = optional(object({
      aws_regions              = optional(list(string), ["eu-central-1"])
      fetch_extended_inventory = optional(bool, true)
      fetch_tags               = optional(bool, true)
      metrics_polling_interval = optional(number, 300)
    }))

    cloudfront = optional(object({
      metrics_polling_interval = optional(number, 300)
      fetch_lambdas_at_edge    = optional(bool, true)
      fetch_tags               = optional(bool, true)
    }))

    ecs = optional(object({
      aws_regions              = optional(list(string), ["eu-central-1"])
      metrics_polling_interval = optional(number, 300)
      fetch_tags               = optional(bool, true)
    }))
  })
}
