output "id_dispatch_new_service" {
  description = "An identifier for the resource with format {{project}}"
  value       = module.appengine_dispatch_rules_new_service.id
}

output "id_dispatch_default" {
  description = "An identifier for the resource with format {{project}}"
  value       = module.appengine_dispatch_rules_default_service.id
}

output "id_gae_service" {
  description = "an identifier for the resource with format apps/{{project}}/services/{{service}}/versions/{{version_id}}"
  value       = module.standard_service.id
}

output "name_gae_service" {
  description = "Full path to the Version resource in the API. Example, `v1`."
  value       = module.standard_service.name
}