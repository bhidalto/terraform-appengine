output "id" {
  description = "An identifier for the resource with format apps/{{project}}/domainMappings/{{domain_name}}"
  value       = module.appengine_domain_mapping.id
}

output "name" {
  description = "Full path to the DomainMapping resource in the API. Example: apps/myapp/domainMapping/example.com"
  value       = module.appengine_domain_mapping.name
}

output "resource_records" {
  description = "The resource records required to configure this domain mapping. These records must be added to the domain's DNS configuration in order to serve the application via this domain mapping."
  value       = module.appengine_domain_mapping.resource_records
}

output "resource_records_name" {
  description = "(Optional) Relative name of the object affected by this record. Only applicable for CNAME records. Example: 'www'."
  value       = module.appengine_domain_mapping.resource_records[0]
}

output "resource_records_rrdata" {
  description = "(Optional) Data for this record. Values vary by record type, as defined in RFC 1035 (section 5) and RFC 1034 (section 3.6.1)."
  value       = module.appengine_domain_mapping.resource_records[1]
}

output "resource_records_type" {
  description = "(Optional) Resource record type. Example: AAAA. Possible values are A, AAAA, and CNAME."
  value       = module.appengine_domain_mapping.resource_records[2]
}