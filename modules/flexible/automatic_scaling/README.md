# App Engine Flex Automatic Scaling module

This module is intended to easily create App Engine Flexible Automatic Scaling services using Terraform.

## Usage

```
module "flexible_automtic_scaling" {
  version_id = "v1"
  service    = "default"
  runtime    = "nodejs"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "url-to-zip"
    }
  }

  liveness_check {
    path = "/"
  }

  readiness_check {
    path = "/"
  }

  env_variables = {
    port = "8080"
  }

  handlers {
    url_regex        = ".*\\/my-path\\/*"
    security_level   = "SECURE_ALWAYS"
    login            = "LOGIN_REQUIRED"
    auth_fail_action = "AUTH_FAIL_ACTION_REDIRECT"

    static_files {
      path = "my-other-path"
      upload_path_regex = ".*\\/my-path\\/*"
    }
  }

  automatic_scaling {
    cool_down_period = "120s"
    cpu_utilization {
      target_utilization = 0.5
    }
  }
  noop_on_destroy = true
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the App Engine Flexible Automatic Scaling service.

| Variable | Description | Default value|
| --- | --- | -- |
| [runtime](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#runtime) | (Required) The runtime that will be used by App Engine. | python |
| [readiness_check](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#readiness_checks) | (Required) Configures readiness health checking for instances. Unhealthy instances are not put into the backend traffic rotation. Structure is documented below. | -- |
| [readiness_check/path](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#readiness_path) | (Required) The request path. | "/readiness" |
| [readiness_check/host](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#ReadinessCheck.FIELDS.host) | (Optional) Host header to send when performing a HTTP Readiness check. | -- |
| [readiness_check/failure_threshold](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#readiness_failure) | (Optional) Number of consecutive failed checks required before removing traffic. | 2 |
| [readiness_check/success_threshold](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#ReadinessCheck.FIELDS.success_threshold) | (Optional) Number of consecutive successful checks required before receiving traffic. | 2 |
| [readiness_check/check_interval](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#readiness_interval) | (Optional) Interval between health checks. | "5s" |
| [readiness_check/timeout](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#ReadinessCheck.FIELDS.timeout) | (Optional) Time before the check is considered failed. | "4s" |
| [readiness_check/app_start_timeout](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#timeout) | (Optional) A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic. | "300s" |
| [liveness_check](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#liveness_checks) | (Required) Health checking configuration for VM instances. Unhealthy instances are killed and replaced with new instances. | -- |
| [liveness_check/path](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#liveness_path) | (Required) The request path. | "/liveness" |
| [liveness_check/host](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#LivenessCheck.FIELDS.host) | (Optional) Host header to send when performing a HTTP Readiness check. | -- |
| [liveness_check/failure_threshold](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#liveness_failure) | (Optional) Number of consecutive failed checks required before considering the VM unhealthy. | 4 |
| [liveness_check/success_threshold](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#liveness_success) | (Optional) Number of consecutive successful checks required before receiving traffic. | 2 |
| [liveness_check/check_interval](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#liveness_interval) | (Optional) Interval between health checks. | "30s" |
| [liveness_check/timeout](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#liveness_timeout) | (Optional) Time before the check is considered failed. | "4s" |
| [liveness_check/initial_delay](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#delay) | (Optional) A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic. | "300s" |
| [service_version](https://cloud.google.com/appengine/docs/flexible/python/reference/app-yaml#service) | (Optional) Name of the App Engine version of the Service that will be deployed. | -- |
| [inbound_services](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#inboundservicetype) | (Optional) A list of the types of messages that this application is able to receive. | -- |
| [instance_class](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.instance_class) | (Optional) Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen. | "F1" |
| [network](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#network) | (Optional) Extra network settings to be defined for the App Engine service. | -- |
| [resources](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#resources) | (Optional) Machine resources for a version. | -- |
| [runtime_channel](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.runtime_channel) | (Optional) The channel of the runtime to use. Only available for some runtimes. | -- |
| [beta_settings](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.beta_settings) | (Optional) Metadata settings that are supplied to this version to enable beta runtime features. | -- |
| [serving_status](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#servingstatus) | (Optional) Current serving status of this version. Only the versions with a SERVING status create instances and can be billed. | -- |
| [api_version](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.runtime_api_version) | (Optional)The version of the API in the given runtime environment that is used by your app. The field is deprecated for newer App Engine runtimes. | 1 |
| [handlers](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#urlmap) | (Optional) An ordered list of URL-matching patterns that should be applied to incoming requests. The first matching URL handles the request and other request handlers are not attempted. | -- |
| [runtime_main_executable_path](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.runtime_main_executable_path) | (Optional) The path or name of the app's main executable. | -- |
| [api_config](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#apiconfighandler) | (Optional) Serving configuration for Google Cloud Endpoints. | -- |
| [env_variables](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.env_variables) | (Optional) Environment variables to be passed to the App Engine service. | -- |
| [default_expiration](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.default_expiration) | (Optional) Duration that static files should be cached by web proxies and browsers. Only applicable if the corresponding StaticFilesHandler does not specify its own expiration time. | -- |
| [nobuild_files_regex](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.nobuild_files_regex) | (Optional) Files that match this pattern will not be built into this version. Only applicable for Go runtimes. | -- |
| [deployment/zip](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#zipinfo) | (Optional) Zip File Structure. | -- |
| [deployment/files](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Deployment.FIELDS.files) | (Optional) (Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version. | -- |
| [deployment/container](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#containerinfo) | (Optional) The Docker image for the container that runs the version. | -- |
| [deployment/cloud_build_options](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#cloudbuildoptions) | (Optional) Options for the build operations performed as a part of the version deployment. Only applicable when creating a version using source code directly. | -- |
| [endpoints_api_service](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#endpointsapiservice) | (Optional) Code and application artifacts that make up this version. | -- |
| [entrypoint](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#entrypoint) | (Optional) The entrypoint for the application. | -- |
| [automatic_scaling/cool_down_period](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.cool_down_period) | (Optional) The time period that the Autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. | "120s" |
| [automatic_scaling/cpu_utilization/aggregation_window_length](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#CpuUtilization.FIELDS.aggregation_window_length) | (Optional) Period of time over which CPU utilization is calculated. | -- |
| [automatic_scaling/cpu_utilization/target_utilization](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#CpuUtilization.FIELDS.target_utilization) | (Required) Target CPU utilization ratio to maintain when scaling. Must be between 0 and 1. | -- |
| [automatic_scaling/max_concurrent_requests](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_concurrent_requests) | (Optional) Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. | -- |
| [automatic_scaling/max_idle_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_idle_instances) | (Optional) Maximum number of idle instances that should be maintained for this version. | -- |
| [automatic_scaling/max_total_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_total_instances) | (Optional) Maximum number of instances that should be started to handle requests for this version. | 20 |
| [automatic_scaling/max_pending_latency](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.max_pending_latency) | (Optional) Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. | -- |
| [automatic_scaling/min_idle_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.min_idle_instances) | (Optional) Minimum number of idle instances that should be maintained for this version. | -- |
| [automatic_scaling/min_total_instances](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.min_total_instances) | (Optional) Minimum number of running instances that should be maintained for this version.  | 2 |
| [automatic_scaling/min_pending_latency](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#AutomaticScaling.FIELDS.min_pending_latency) | (Optional) Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it.  | -- |
| [automatic_scaling/request_utilization/target_request_count_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#RequestUtilization.FIELDS.target_request_count_per_second) | (Optional) Target requests per second.  | -- |
| [automatic_scaling/request_utilization/target_concurrent_requests](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#RequestUtilization.FIELDS.target_concurrent_requests) | (Optional) Target number of concurrent requests.  | -- |
| [automatic_scaling/disk_utilization/target_write_bytes_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#DiskUtilization.FIELDS.target_write_bytes_per_second) | (Optional) Target bytes written per second.  | -- |
| [automatic_scaling/disk_utilization/target_write_ops_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#DiskUtilization.FIELDS.target_write_ops_per_second) | (Optional) Target ops written per second.  | -- |
| [automatic_scaling/disk_utilization/target_read_bytes_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#DiskUtilization.FIELDS.target_read_bytes_per_second) | (Optional) Target bytes read per second.  | -- |
| [automatic_scaling/disk_utilization/target_read_ops_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#DiskUtilization.FIELDS.target_read_ops_per_second) | (Optional) Target ops read per seconds.  | -- |
| [automatic_scaling/network_utilization/target_sent_bytes_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#NetworkUtilization.FIELDS.target_sent_bytes_per_second) | (Optional) Target bytes sent per second.  | -- |
| [automatic_scaling/network_utilization/target_sent_packets_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#NetworkUtilization.FIELDS.target_sent_packets_per_second) | (Optional) Target packets sent per second.  | -- |
| [automatic_scaling/network_utilization/target_received_bytes_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#NetworkUtilization.FIELDS.target_received_bytes_per_second) | (Optional) Target bytes received per second.  | -- |
| [automatic_scaling/network_utilization/target_received_packets_per_second](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#NetworkUtilization.FIELDS.target_received_packets_per_second) | (Optional) Target packets received per second.  | -- |
| noop_on_destroy | (Optional)If set to true, the application version will not be deleted upon running Terraform destroy. | true |
| delete_service_on_destroy | (Optional)If set to true, the service will be deleted if it is the last version. | false |

## Outputs

Once the App Engine Flexible Automatic Scaling has been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `apps/{{project}}/services/{{service}}/versions/{{version_id}}` |
| name | Full path to the Version resource in the API. Example, `v1`. |
