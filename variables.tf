variable "queue" {
  description = "Application queue name (e.g. DEV-MYAPP); unique across your infra"
}

variable "aws_account_id" {
  description = "AWS account id"
}

variable "aws_region" {
  description = "AWS region"
}

variable "max_receive_count" {
  description = "Maximum number of receives allowed before message is moved to the dead-letter-queue"
  default     = 4
}

variable "tags" {
  description = "Tags to attach to the SQS queues"
  type        = "map"
}

variable "alerting" {
  description = "Should Cloudwatch alerts be generated?"
  default     = "false"
}

variable "queue_alarm_high_message_count_threshold" {
  description = "Threshold for alerting on high message count in main queue"
  default     = 5000
}

variable "queue_alarm_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for main queue Alarm for high message count (required if alerting is on)"
  type        = "list"
  default     = []
}

variable "queue_ok_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for main queue OK for high message count (required if alerting is on)"
  type        = "list"
  default     = []
}

variable "dlq_alarm_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for dead-letter queue Alarm for high message count (required if alerting is on)"
  type        = "list"
  default     = []
}

variable "dlq_ok_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for dead-letter queue OK for high message count (required if alerting is on)"
  type        = "list"
  default     = []
}
