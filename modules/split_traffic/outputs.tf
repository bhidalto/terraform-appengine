output "id" {
  description = "An identifier for the resource with format apps/{{project}}/services/{{service}}"
  value       = google_app_engine_service_split_traffic.split_traffic.id
}