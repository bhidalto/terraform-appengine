output "id" {
  description = "an identifier for the resource with format apps/{{project}}/services/{{service}}/versions/{{version_id}}"
  value       = google_app_engine_standard_app_version.appengine_standard.id
}

output "name" {
  description = "Full path to the Version resource in the API. Example, `v1`."
  value       = google_app_engine_standard_app_version.appengine_standard.name
}