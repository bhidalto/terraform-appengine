# App Engine Standard Automatic Scaling module

This module is intended to easily create App Engine Standard Automatic Scaling services using Terraform.

## Usage

```
module "standard_automatic_scaling" {
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

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances = 1
    max_idle_instances = 3
    min_pending_latency = "1s"
    max_pending_latency = "5s"
    standard_scheduler_settings {
      target_cpu_utilization = 0.5
      target_throughput_utilization = 0.75
      min_instances = 2
      max_instances = 10
    }
  }

  noop_on_destroy = true
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the App Engine Standard Automatic Scaling service.

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
| [automatic_scaling/max_concurrent_requests](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_concurrent_requests) | (Optional) Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. | 10 |
| [automatic_scaling/max_idle_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_idle_instances) | (Optional) Maximum number of idle instances that should be maintained for this version. | 10 |
| [automatic_scaling/max_pending_latency](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_pending_latency) | (Optional) Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | "30ms" |
| [automatic_scaling/min_idle_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.min_idle_instances) | (Optional) Minimum number of idle instances that should be maintained for this version. | 3 |
| [automatic_scaling/min_pending_latency](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.min_pending_latency) | (Optional) Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | "0s" |
| [automatic_scaling/standard_scheduler_settings/target_cpu_utilization](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#StandardSchedulerSettings.FIELDS.target_cpu_utilization) | (Optional) Target CPU utilization ratio to maintain when scaling. | 0.6 |
| [automatic_scaling/standard_scheduler_settings/target_throughput_utilization](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#StandardSchedulerSettings.FIELDS.target_throughput_utilization) | ((Optional) Target throughput utilization ratio to maintain when scaling.  | 0.6 |
| [automatic_scaling/standard_scheduler_settings/min_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#StandardSchedulerSettings.FIELDS.min_instances) | Optional) Minimum number of instances to run for this version. Set to zero to disable minInstances configuration. | 0 |
| [automatic_scaling/standard_scheduler_settings/max_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#StandardSchedulerSettings.FIELDS.max_instances) | (Optional) Maximum number of instances to run for this version. Set to zero to disable maxInstances configuration. | 1 |
| noop_on_destroy | (Optional)If set to true, the application version will not be deleted upon running Terraform destroy. | true |
| delete_service_on_destroy | (Optional)If set to true, the service will be deleted if it is the last version. | false |

## Outputs

Once the App Engine Standard Automatic Scaling has been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `apps/{{project}}/services/{{service}}/versions/{{version_id}}` |
| name | Full path to the Version resource in the API. Example, `v1`. |
