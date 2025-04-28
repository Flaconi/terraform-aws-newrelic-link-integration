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


  dynamic "billing" {
    for_each = var.integrations.billing != null ? [1] : []
    content {
      metrics_polling_interval = var.integrations.billing.metrics_polling_interval
    }
  }

  dynamic "health" {
    for_each = var.integrations.health != null ? [1] : []
    content {
      metrics_polling_interval = var.integrations.health.metrics_polling_interval
    }
  }
  dynamic "elasticbeanstalk" {
    for_each = var.integrations.elasticbeanstalk != null ? [1] : []
    content {
      aws_regions              = var.integrations.elasticbeanstalk.aws_regions
      fetch_extended_inventory = var.integrations.elasticbeanstalk.fetch_extended_inventory
      fetch_tags               = var.integrations.elasticbeanstalk.fetch_tags
      metrics_polling_interval = var.integrations.elasticbeanstalk.metrics_polling_interval
    }
  }

  dynamic "cloudfront" {
    for_each = var.integrations.cloudfront != null ? [1] : []
    content {
      metrics_polling_interval = var.integrations.cloudfront.metrics_polling_interval
      fetch_lambdas_at_edge    = var.integrations.cloudfront.fetch_lambdas_at_edge
      fetch_tags               = var.integrations.cloudfront.fetch_tags
    }
  }
  dynamic "ecs" {
    for_each = var.integrations.ecs != null ? [1] : []
    content {
      aws_regions              = var.integrations.ecs.aws_regions
      metrics_polling_interval = var.integrations.ecs.metrics_polling_interval
      fetch_tags               = var.integrations.ecs.fetch_tags
    }
  }
}
