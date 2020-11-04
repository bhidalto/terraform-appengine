# Handler's Script module

This module is intended to easily create a Script module for the Handlers module.

## Usage

```
module "handler_script" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/handler_script"
  script_path  = "my/path/to/script.py"
}
```

## Variables

Below is the list of available variables to be used upon creation of the Handler Script module.

| Variable | Description | Default value|
| --- | --- | -- |
| [script_path](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_script) | (Required) Path to the script from the application root directory. | -- |
