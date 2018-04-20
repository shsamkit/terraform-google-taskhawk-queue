output "queue_arn" {
  value       = "${aws_sqs_queue.sqs_queue.arn}"
  description = "ARN of the SQS queue"
}

output "queue_name" {
  value       = "${aws_sqs_queue.sqs_queue.name}"
  description = "Name of the SQS queue"
}

output "dlq_arn" {
  value       = "${aws_sqs_queue.dlq.arn}"
  description = "ARN of the DLQ"
}

output "dlq_name" {
  value       = "${aws_sqs_queue.dlq.name}"
  description = "Name of the DLQ"
}
