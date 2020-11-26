output "id" {
  description = "An identifier for the resource with format {{project}}"
  value       = google_app_engine_application_url_dispatch_rules.dispatch_rules.id
}