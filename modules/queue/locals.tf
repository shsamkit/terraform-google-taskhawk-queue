locals {
  title_suffix  = "${var.alerting_project != data.google_project.current.project_id ? format(" (%s)", data.google_project.current.name) : ""}"
  filter_suffix = "${var.alerting_project != data.google_project.current.project_id ? format(" project=\"%s\"", data.google_project.current.project_id) : ""}"
}
