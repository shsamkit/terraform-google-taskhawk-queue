resource "google_pubsub_topic" "topic" {
  name = "taskhawk-${var.queue}"

  labels = "${var.labels}"
}

resource "google_pubsub_subscription" "subscription" {
  name  = "taskhawk-${var.queue}"
  topic = "${google_pubsub_topic.topic.name}"

  ack_deadline_seconds = 20

  labels = "${var.labels}"
}

resource "google_pubsub_topic" "dlq_topic" {
  name = "taskhawk-${var.queue}-dlq"

  labels = "${var.labels}"
}

resource "google_pubsub_subscription" "dlq_subscription" {
  name  = "taskhawk-${var.queue}-dlq"
  topic = "${google_pubsub_topic.dlq_topic.name}"

  ack_deadline_seconds = 20

  labels = "${var.labels}"
}

resource "google_monitoring_alert_policy" "high_message_alert" {
  count = "${var.alerting == "true" ? 1 : 0}"

  display_name = "${title(var.queue)} Taskhawk queue message count too high"
  combiner     = "OR"

  conditions {
    display_name = "${title(var.queue)} Taskhawk queue message count too high"

    condition_threshold {
      threshold_value = "${var.queue_alarm_high_message_count_threshold}" // Number of messages
      comparison      = "COMPARISON_GT"
      duration        = "300s"                                            // Seconds

      filter = "metric.type=\"pubsub.googleapis.com/subscription/num_undelivered_messages\" resource.type=\"pubsub_subscription\" resource.label.\"subscription_id\"=\"${google_pubsub_subscription.subscription.name}\""

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }

      trigger {
        count = 1
      }
    }
  }

  notification_channels = "${var.queue_high_message_count_notification_channels}"
}

resource "google_monitoring_alert_policy" "dlq_alert" {
  count = "${var.alerting == "true" ? 1 : 0}"

  display_name = "${title(var.queue)} Taskhawk DLQ is non-empty"
  combiner     = "OR"

  conditions {
    display_name = "${title(var.queue)} Taskhawk DLQ is non-empty"

    condition_threshold {
      threshold_value = "1"             // Number of messages
      comparison      = "COMPARISON_GT"
      duration        = "60s"           // Seconds

      filter = "metric.type=\"pubsub.googleapis.com/subscription/num_undelivered_messages\" resource.type=\"pubsub_subscription\" resource.label.\"subscription_id\"=\"${google_pubsub_subscription.dlq_subscription.name}\""

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_SUM"
      }

      trigger {
        count = 1
      }
    }
  }

  notification_channels = "${var.dlq_high_message_count_notification_channels}"
}

data "google_client_config" "current" {}

resource "google_dataflow_job" "firehose" {
  count = "${var.enable_firehose_all_messages ? 1 : 0}"

  name              = "${google_pubsub_topic.topic.name}-firehose"
  temp_gcs_location = "${var.dataflow_tmp_gcs_location}"
  template_gcs_path = "${var.dataflow_template_gcs_path}"

  zone = "${var.dataflow_zone}"

  parameters = {
    inputTopic           = "projects/${data.google_client_config.current.project}/topics/${google_pubsub_topic.topic.name}"
    outputDirectory      = "${var.dataflow_output_directory}"
    outputFilenamePrefix = "${var.dataflow_output_filename_prefix == "" ? format("%s-", google_pubsub_topic.topic.name) : var.dataflow_output_filename_prefix}"
  }
}
