output "default_topic_name" {
  value       = module.queue_default.topic_name
  description = "Pubsub topic name for the default queue"
}

output "default_topic_id" {
  value       = module.queue_default.topic_id
  description = "Pubsub topic id for the default queue"
}

output "default_subscription_name" {
  value       = module.queue_default.subscription_name
  description = "Pubsub subscription name for the default queue"
}

output "default_subscription_path" {
  value       = module.queue_default.subscription_path
  description = "Pubsub subscription path for the default queue"
}

output "default_dlq_topic_name" {
  value       = module.queue_default.dlq_topic_name
  description = "DLQ pubsub topic name for the default queue"
}

output "default_dlq_subscription_name" {
  value       = module.queue_default.dlq_subscription_name
  description = "DLQ pubsub subscription name for the default queue"
}

output "default_dlq_subscription_path" {
  value       = module.queue_default.dlq_subscription_path
  description = "DLQ pubsub subscription path for the default queue"
}

output "high_priority_topic_name" {
  value       = module.queue_high_priority.topic_name
  description = "Pubsub topic name for the high priority queue"
}

output "high_priority_subscription_name" {
  value       = module.queue_high_priority.subscription_name
  description = "Pubsub subscription name for the high priority queue"
}

output "high_priority_subscription_path" {
  value       = module.queue_high_priority.subscription_path
  description = "Pubsub subscription path for the high priority queue"
}

output "high_priority_dlq_topic_name" {
  value       = module.queue_high_priority.dlq_topic_name
  description = "DLQ pubsub topic name for the high priority queue"
}

output "high_priority_dlq_subscription_name" {
  value       = module.queue_high_priority.dlq_subscription_name
  description = "DLQ pubsub subscription name for the high priority queue"
}

output "high_priority_dlq_subscription_path" {
  value       = module.queue_high_priority.dlq_subscription_path
  description = "DLQ pubsub subscription path for the high priority queue"
}

output "low_priority_topic_name" {
  value       = module.queue_low_priority.topic_name
  description = "Pubsub topic name for the low priority queue"
}

output "low_priority_subscription_name" {
  value       = module.queue_low_priority.subscription_name
  description = "Pubsub subscription name for the low priority queue"
}

output "low_priority_subscription_path" {
  value       = module.queue_low_priority.subscription_path
  description = "Pubsub subscription path for the low priority queue"
}

output "low_priority_dlq_topic_name" {
  value       = module.queue_low_priority.dlq_topic_name
  description = "DLQ pubsub topic name for the low priority queue"
}

output "low_priority_dlq_subscription_name" {
  value       = module.queue_low_priority.dlq_subscription_name
  description = "DLQ pubsub subscription name for the low priority queue"
}

output "low_priority_dlq_subscription_path" {
  value       = module.queue_low_priority.dlq_subscription_path
  description = "DLQ pubsub subscription path for the low priority queue"
}

output "bulk_topic_name" {
  value       = module.queue_bulk.topic_name
  description = "Pubsub topic name for the bulk queue"
}

output "bulk_subscription_name" {
  value       = module.queue_bulk.subscription_name
  description = "Pubsub subscription name for the bulk queue"
}

output "bulk_subscription_path" {
  value       = module.queue_bulk.subscription_path
  description = "Pubsub subscription path for the bulk queue"
}

output "bulk_dlq_topic_name" {
  value       = module.queue_bulk.dlq_topic_name
  description = "DLQ pubsub topic name for the bulk queue"
}

output "bulk_dlq_subscription_name" {
  value       = module.queue_bulk.dlq_subscription_name
  description = "DLQ pubsub subscription name for the bulk queue"
}

output "bulk_dlq_subscription_path" {
  value       = module.queue_bulk.dlq_subscription_path
  description = "DLQ pubsub subscription path for the bulk queue"
}
