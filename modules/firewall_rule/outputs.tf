output "id" {
  description = "An identifier for the resource with format apps/{{project}}/firewall/ingressRules/{{priority}}"
  value       = google_app_engine_firewall_rule.firewall_rule.id
}