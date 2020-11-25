output "id" {
  description = "An identifier for the resource with format apps/{{project}}/services/{{service}}"
  value       = module.appengine_service_split_traffic.id
}