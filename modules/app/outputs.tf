output "id" {
  description = "An identifier for the resource with format {{project}}."
  value       = google_app_engine_application.appengine_app.id
}

output "name" {
  description = "Unique name of the app, usually apps/{PROJECT_ID}."
  value       = google_app_engine_application.appengine_app.name
}

output "app_id" {
  description = "Identifier of the app, usually {PROJECT_ID}."
  value       = google_app_engine_application.appengine_app.app_id
}

output "url_dispatch_rule" {
  description = "A list of dispatch rule blocks. Each block has a domain, path, and service field."
  value       = google_app_engine_application.appengine_app.url_dispatch_rule
}

output "code_bucket" {
  description = "The GCS bucket code is being stored in for this app."
  value       = google_app_engine_application.appengine_app.code_bucket
}

output "default_hostname" {
  description = "The default hostname for this app."
  value       = google_app_engine_application.appengine_app.default_hostname
}

output "default_bucket" {
  description = "The GCS bucket content is being stored in for this app."
  value       = google_app_engine_application.appengine_app.default_bucket
}

output "gcr_domain" {
  description = "The GCR domain used for storing managed Docker images for this app."
  value       = google_app_engine_application.appengine_app.gcr_domain
}

output "iap" {
  description = "Settings for enabling Cloud Identity Aware Proxy."
  value       = google_app_engine_application.appengine_app.iap
}

output "iap_enabled" {
  description = "(Optional) Whether the serving infrastructure will authenticate and authorize all incoming requests. (default is false)"
  value       = length(google_app_engine_application.appengine_app.iap) != 0 ? google_app_engine_application.appengine_app.iap[0] : false 
}

output "iap_oauth2_client_secret_sha256" {
  description = "Hex-encoded SHA-256 hash of the client secret."
  value       = length(google_app_engine_application.appengine_app.iap) != 0 ? google_app_engine_application.appengine_app.iap[1] : "IAP is not enabled for this app."
}