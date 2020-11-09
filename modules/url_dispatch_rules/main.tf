resource "google_app_engine_application_url_dispatch_rules" "dispatch_rules" {
  dispatch_rules {
    domain  = var.domain
    path    = var.path
    service = var.service
  }
}