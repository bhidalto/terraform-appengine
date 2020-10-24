# Automatic Scaling settings module

This module is intended to easily create Automatic Scaling settings for App Engine using Terraform.

## Usage

```
module "automatic_scaling" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/automatic_scaling"
  max_concurrent_requests     = 10
  max_idle_instances          = "automatic"
  max_pending_latency         = "30ms"
  min_idle_instances          = 3
  min_pending_latency         = "0s"
  standard_scheduler_settings = {
      target_cpu_utilization        = 0.5
      target_throughput_utilization = 0.5
      min_instances                 = 1
      max_instances                 = 2    
  }
}
```

## Variables

Below is the list of available variables to be used upon creation of the Automatic Scaling settings.

| Variable | Description | Default value|
| --- | --- | -- |
| [max_concurrent_requests](https://cloud.google.com/appengine/docs/standard/python/config/appref#max_concurrent_requests) | (Optional) Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Must be within range [10,80]. | 10 |
| [max_idle_instances](https://cloud.google.com/appengine/docs/standard/python/config/appref#max_idle_instances) | (Optional) Maximum number of idle instances that should be maintained for this version. Must be "automatic" or within range [1,1000].  | "automatic" |
| [max_pending_latency](https://cloud.google.com/appengine/docs/standard/python/config/appref#max_pending_latency) | (Optional) Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it.  | "30ms" |
| [min_idle_instances](https://cloud.google.com/appengine/docs/standard/python/config/appref#min_idle_instances) | (Optional; Default: automatic ) Minimum number of idle instances that should be maintained for this version. Must be "automatic" or within range [1,1000].  | "automatic" |
| [min_pending_latency](https://cloud.google.com/appengine/docs/standard/python/config/appref#min_pending_latency) | (Optional; Default: 0s) Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it.  | "0s" |
| [standard_scheduler_settings](../standard_scheduler_settings/) | (Optional) Scheduler settings for standard environment. Allows to specify the minimum and maximum amount of instances as well as the target CPU and throughput.  | -- |

