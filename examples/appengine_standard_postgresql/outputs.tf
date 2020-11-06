#Outputs for Cloud SQL Postgres instance
output "self_link" {
  description = "A self link of the newly created Cloud SQL instance."
  value       = module.private_postgres_instance.self_link
}

output "postgres_connection_name" {
  description = "The connection name for the Cloud SQL instance created. It has the following format: `[PROJECT_ID]:[REGION]:[INSTANCE_NAME]` "
  value       = module.private_postgres_instance.connection_name
}

output "postgres_private_ip_address" {
  description = "The private IPv4 address assigned to the Cloud SQL instance created."
  value       = module.private_postgres_instance.private_ip_address
}

output "postgres_name" {
  description = "Name of the Cloud SQL instance. "
  value       = module.private_postgres_instance.name
}

#Outputs for Cloud SQL Postgres Database

output "cloudsql_db_id" {
  description = "An identifier for the resource with format projects/{{project}}/instances/{{instance}}/databases/{{name}}"
  value       = module.cloud_sql_database.id
}

output "cloudsql_db_self_link" {
  description = "The URI of the created resource."
  value       = module.cloud_sql_database.self_link
}


# Outputs for SVPC connector module
output "svpc_connector_id" {
  value = module.svpc_connector.id
}

output "svpc_connector_state" {
  value = module.svpc_connector.state
}

output "svpc_connector_self_link" {
  value = module.svpc_connector.self_link
}

# Outputs for GAE module
output "gae_id" {
  description = "An identifier for the resource with format apps/{{project}}/services/{{service}}/versions/{{version_id}}"
  value       = module.appengine_standard_automatic_scaling.id
}

output "gae_name" {
  description = "Full path to the Version resource in the API. Example, `v1`."
  value       = module.appengine_standard_automatic_scaling.name
}