# Domain mappings module

This module is intended to easily create Domain mappings for App Engine by using Terraform.

## Usage

```
module "domain_mapping" {
  domain_name = "verified-domain.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the domain mapping.

| Variable | Description | Default value|
| --- | --- | -- |
| [domain_name](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.domainMappings#DomainMapping.FIELDS.name) | (Required) Relative name of the domain serving the application. | -- |
| [ssl_settings](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.domainMappings#SslSettings) | (Optional) SSL configuration for this domain. If unconfigured, this domain will not serve with SSL. | -- |
| [ssl_settings/certificate_id](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.domainMappings#SslSettings.FIELDS.certificate_id) | (Optional) ID of the AuthorizedCertificate resource configuring SSL for the application. Clearing this field will remove SSL support. By default, a managed certificate is automatically created for every domain mapping. To omit SSL support or to configure SSL manually, specify SslManagementType.MANUAL on a CREATE or UPDATE request. You must be authorized to administer the AuthorizedCertificate resource to manually map it to a DomainMapping resource. | -- |
| [ssl_settings/ssl_management_type](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.domainMappings#sslmanagementtype) | (Required) SSL management type for this domain. If `AUTOMATIC`, a managed certificate is automatically provisioned. If `MANUAL`, certificateId must be manually specified in order to configure SSL for this domain. Possible values are `AUTOMATIC` and `MANUAL`. | -- |
| [ssl_settings/pending_managed_certificate_id](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.domainMappings#SslSettings.FIELDS.pending_managed_certificate_id) | ID of the managed AuthorizedCertificate resource currently being provisioned, if applicable. Until the new managed certificate has been successfully provisioned, the previous SSL state will be preserved. Once the provisioning process completes, the certificateId field will reflect the new managed certificate and this field will be left empty. To remove SSL support while there is still a pending managed certificate, clear the certificateId field with an update request. | -- |
| override_strategy | (Optional) Whether the domain creation should override any existing mappings for this domain. By default, overrides are rejected. Possible values are `STRICT` and `OVERRIDE`. | -- |


## Outputs

Once the domain mappings have been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `apps/{{project}}/domainMappings/{{domain_name}}` |
| name | Full path to the DomainMapping resource in the API. Example: `apps/myapp/domainMapping/example.com` |
| resource_records | (Optional) Relative name of the object affected by this record. Only applicable for CNAME records. Example: 'www'. |
| resource_records_name | (Optional) Relative name of the object affected by this record. Only applicable for CNAME records. Example: 'www'. |
| resource_records_rrdata | (Optional) Data for this record. Values vary by record type, as defined in RFC 1035 (section 5) and RFC 1034 (section 3.6.1). |
| resource_records_type | (Optional) Resource record type. Example: AAAA. Possible values are A, AAAA, and CNAME. |
