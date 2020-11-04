output "id" {
  description = "An identifier for the resource with format apps/{{project}}/services/{{service}}/versions/{{version_id}}"
  value       = module.appengine_standard_basic_scaling.id
}

output "name" {
  description = "Full path to the Version resource in the API. Example, `v1`."
  value       = module.appengine_standard_basic_scaling.name
}