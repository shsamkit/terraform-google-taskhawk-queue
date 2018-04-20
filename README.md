Hedwig Queue Consumer App Terraform module
==========================================

[Hedwig](https://github.com/Automatic/hedwig) is a inter-service communication bus that works on AWS SQS/SNS, while keeping things pretty simple and
straight forward. It uses [json schema](http://json-schema.org/) draft v4 for schema validation so all incoming
and outgoing messages are validated against pre-defined schema.

This module provides a custom [Terraform](https://www.terraform.io/) modules for deploying Hedwig infrastructure that
creates infra for Hedwig consumer app.

## Usage 

```hcl
module "consumer-dev-myapp" {
  source   = "Automatic/hedwig-queue/aws"
  queue    = "DEV-MYAPP"
  alerting = true

  tags = {
    app     = "myapp"
    env     = "dev"
  }
}
```

It's recommended that `queue` include your environment. 

Naming convention - uppercase alphanumeric and dashes only.

The SQS queue name will be prefixed by `HEDWIG-`.

## Release Notes

[Github Releases](https://github.com/Automatic/terraform-aws-hedwig-queue/releases)

## How to publish

Go to [Terraform Registry](https://registry.terraform.io/modules/Automatic/hedwig-queue/aws), and Resync module.
