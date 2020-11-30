# App Engine Standard Manual Scaling module

This module is intended to easily create App Engine Standard Manual Scaling services using Terraform.

## Usage

```
module "standard_manual_scaling" {
  version_id = "v2"
  service    = "myapp"
  runtime    = "nodejs10"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  manual_scaling {
    instances = 5
  }

  noop_on_destroy = true
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the App Engine Standard Manual Scaling service.

| Variable | Description | Default value|
| --- | --- | -- |
| [runtime](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.runtime) | (Required) The runtime that will be used by App Engine. Supported runtimes are: python27, python37, python38, java8, java11, php55, php73, php74, ruby25, go111, go112, go113, go114, nodejs10, nodejs12. | python27 |
| [deployment](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#deployment) | (Required) Code and application artifacts that make up this version. | -- |
| [deployment/zip](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#zipinfo) | (Optional) Zip File Structure. | -- |
| [deployment/files](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Deployment.FIELDS.files) | (Optional) (Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version. | -- |
| service | (Required) AppEngine service resource | -- |
| [service_version](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.id) | (Optional) Name of the App Engine version of the Service that will be deployed. | -- |
| [threadsafe](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.threadsafe) | (Optional) Whether multiple requests can be dispatched to this version at once. | -- |
| [runtime_api_version](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.runtime_api_version) | (Optional)The version of the API in the given runtime environment that is used by your app. The field is deprecated for newer App Engine runtimes. | -- |
| [handlers](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#urlmap) | (Optional) An ordered list of URL-matching patterns that should be applied to incoming requests. The first matching URL handles the request and other request handlers are not attempted. | -- |
| [libraries](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#library) | (Optional) Configuration for third-party Python runtime libraries that are required by the application. | -- |
| [libraries/name](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Library.FIELDS.name) | (Optional) Name of the library. Example "django". | -- |
| [libraries/version](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Library.FIELDS.version) | (Optional) Version of the library to select, or "latest". | -- |
| [env_variables](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.env_variables) | (Optional) Environment variables to be passed to the App Engine service. | -- |
| [entrypoint](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#entrypoint) | (Optional) The entrypoint for the application. | -- |
| [vpc_access_connector](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#vpcaccessconnector) | (Optional) Enables VPC connectivity for standard apps. | -- |
| [inbound_services](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#inboundservicetype) | (Optional) A list of the types of messages that this application is able to receive. | -- |
| [instance_class](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.instance_class) | (Optional) Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen. | "B1" |
| [manual_scaling/instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#manualscaling) | (Required) Number of instances to assign to the service at the start. | 1 |
| noop_on_destroy | (Optional)If set to true, the application version will not be deleted upon running Terraform destroy. | true |
| delete_service_on_destroy | (Optional)If set to true, the service will be deleted if it is the last version. | false |

## Outputs

Once the App Engine Standard Manual Scaling has been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `apps/{{project}}/services/{{service}}/versions/{{version_id}}` |
| name | Full path to the Version resource in the API. Example, `v1`. |
