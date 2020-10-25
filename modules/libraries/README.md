# Libraries module

This module is intended to easily create Library modules for App Engine using Terraform.

## Usage

```
module "libraries" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/libraries"
  name    = "django"
  version = "latest"

}
```

## Variables

Below is the list of available variables to be used upon creation of the Libraries module.

| Variable | Description | Default value|
| --- | --- | -- |
| [name](https://cloud.google.com/appengine/docs/standard/python/config/appref#libraries) | (Optional) Name of the library to be added. | -- |
| [version](https://cloud.google.com/appengine/docs/standard/python/config/appref#libraries) | (Optional) Version of the library to select. | "latest" |
