# Standard Scheduler Settings module

This module is intended to easily create Standard Scheduler settings for the Automatic Scaling module.

## Usage

```
module "standard_scheduler_settings" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/standard_scheduler_settings"
  target_cpu_utilization        = 0.5
  target_throughput_utilization = 0.5
  min_instances                 = 1 
  max_instances                 = 2
}
```

## Variables

Below is the list of available variables to be used upon creation of the Standard Scheduler Settings module.

| Variable | Description | Default value|
| --- | --- | -- |
| [target_cpu_utilization](https://cloud.google.com/appengine/docs/standard/python/config/appref#automatic_scaling_target_cpu_utilization) | (Optional) Target CPU utilization ratio to maintain when scaling. When the CPU utilisation bypasses this threshold, a new instance will be spin up. Must be within range [0.5, 0.95].  | 0.6 |
| [target_throughput_utilization](https://cloud.google.com/appengine/docs/standard/python/config/appref#automatic_scaling_target_throughput_utilization) | (Optional) Target throughput utilization ratio to maintain when scaling. When the target_throughput_utilization threshold is bypassed, a new instance is spun up. Must be within range [0.5, 0.95]. | 0.6 |
| [min_instances](https://cloud.google.com/appengine/docs/standard/python/config/appref#automatic_scaling_min_instances) | (Optional) Minimum number of instances to run for this version. Value can be set to 0 for the system to downscale in case of no traffic being served. Must be within range [0,1000]  | 0 |
| [max_instances](https://cloud.google.com/appengine/docs/standard/python/config/appref#automatic_scaling_max_instances) | (Optional; Default: 1) Maximum number of instances to run for this version. Specifying a value of 0 disables the setting. Must be within range [0, 2147483647] | 1 |

