resource "newrelic_cloud_aws_link_account" "pull" {
  arn                    = var.role_arn
  metric_collection_mode = "PULL"
  name                   = var.name
}

resource "newrelic_cloud_aws_link_account" "push" {
  arn                    = var.role_arn
  metric_collection_mode = "PUSH"
  name                   = "${var.name}-stream"
}

resource "newrelic_cloud_aws_integrations" "newrelic_cloud_integration_pull" {
  linked_account_id = newrelic_cloud_aws_link_account.pull.id

  billing {
    metrics_polling_interval = 3600
  }

  health {
    metrics_polling_interval = 600
  }

  elasticbeanstalk {
    aws_regions              = ["eu-central-1"]
    fetch_extended_inventory = false
    fetch_tags               = false
    metrics_polling_interval = 600
  }
}
