# Basic Scaling settings module

This module is intended to easily create Basic Scaling settings for App Engine using Terraform.

## Usage

```
module "basic_scaling" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/basic_scaling"
  idle_timeout  = "25s"
  max_instances = 10

}
```

## Variables

Below is the list of available variables to be used upon creation of the Basic Scaling settings.

| Variable | Description | Default value|
| --- | --- | -- |
| [idle_timeout](https://cloud.google.com/appengine/docs/standard/python/config/appref#idle_timeout) | (Optional) Duration of time after the last request that an instance must wait before the instance is shut down. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s" | "300s" |
| [max_instances](https://cloud.google.com/appengine/docs/standard/python/config/appref#max_instances) | (Required) Maximum number of instances to create for this version. Must be in the range [1.0, 200.0]. | 1 |
