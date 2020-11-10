resource "google_app_engine_firewall_rule" "firewall_rule" {
  source_range = var.source_range
  action       = var.action
  description  = var.description
  priority     = var.priority
}