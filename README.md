Taskhawk Queue App Terraform module
===================================

[Taskhawk](https://github.com/standard-ai/taskhawk) is a replacement for celery that works on AWS SQS/SNS and
Google Pub/Sub, while keeping things pretty simple and straight forward. 

This module provides a custom [Terraform](https://www.terraform.io/) module for deploying Taskhawk 
infrastructure for Taskhawk Queue based app.

Usage
-----
```hcl
module "taskhawk-dev-myapp" {
  source   = "standard-ai/taskhawk-queue/google"
  queue    = "dev-myapp"
  alerting = true

  labels = {
    app     = "myapp"
    env     = "dev"
  }
}
```

It's recommended that `queue` include your environment. 

Naming convention - lowercase alphanumeric and dashes only.

Please note Google's restrictions (if not followed, errors may be confusing and often totally wrong):
- [Labels](https://cloud.google.com/pubsub/docs/labels#requirements)
- [Resource names](https://cloud.google.com/pubsub/docs/admin#resource_names)

The Google topic and subscription names will be prefixed by `taskhawk-`.

## Caveats

Google limits the [lifecycle](https://cloud.google.com/pubsub/docs/subscriber#lifecycle) of a subscription. By default, if a subscription
has not received any messages in 31 days, it'll be deleted. Terraform currently [does not support](https://github.com/terraform-providers/terraform-provider-google/issues/2507)
overriding this behavior. 

## Release Notes

[Github Releases](https://github.com/standard-ai/terraform-google-taskhawk-queue/releases)

## How to publish

Go to [Terraform Registry](https://registry.terraform.io/modules/standard-ai/taskhawk-queue/google), and Resync module.
