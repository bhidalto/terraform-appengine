# Manual Scaling settings module

This module is intended to easily create Manual Scaling settings for App Engine using Terraform.

## Usage

```
module "manual_scaling" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/manual_scaling"
  instances = 10

}
```

## Variables

Below is the list of available variables to be used upon creation of the Manual Scaling settings.

| Variable | Description | Default value|
| --- | --- | -- |
| [instances](https://cloud.google.com/appengine/docs/standard/python/config/appref#instances) | (Required) Number of instances to assign to the service at the start.  | 1 |

