# terraform-aws-newrelic-link-integration

This module create push and pull integration from aws to newrelic with strongly opinionated pull settings

[![lint](https://github.com/flaconi/terraform-aws-newrelic-link-integration/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-aws-newrelic-link-integration/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-aws-newrelic-link-integration/workflows/test/badge.svg)](https://github.com/flaconi/terraform-aws-newrelic-link-integration/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-aws-newrelic-link-integration.svg)](https://github.com/flaconi/terraform-aws-newrelic-link-integration/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.53 |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >= 3.35.2 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.53 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | >= 3.35.2 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_newrelic_api_key_ssm_path"></a> [newrelic\_api\_key\_ssm\_path](#input\_newrelic\_api\_key\_ssm\_path)

Description: ssm path where to retrieve the nr api key

Type: `string`

### <a name="input_newrelic_account_id_ssm_path"></a> [newrelic\_account\_id\_ssm\_path](#input\_newrelic\_account\_id\_ssm\_path)

Description: ssm path where to retrieve the nr account id

Type: `string`

### <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn)

Description: role arn of the nr integration role

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: cloud integration name

Type: `string`

### <a name="input_integrations"></a> [integrations](#input\_integrations)

Description: n/a

Type:

```hcl
object({
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
```

## Optional Inputs

No optional inputs.

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

No outputs.

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2023 **[Flaconi GmbH](https://github.com/flaconi)**
