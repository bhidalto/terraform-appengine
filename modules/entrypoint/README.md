# Entrypoint settings module

This module is intended to easily create Entrypoint settings for the App Engine Standard module.

## Usage

```
module "entrypoint" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/entrypoint"
  shell  = "gunicorn -b :$PORT main:app"
}
```

## Variables

Below is the list of available variables to be used upon creation of the Entrypoint module.

| Variable | Description | Default value|
| --- | --- | -- |
| [shell](https://cloud.google.com/appengine/docs/standard/python3/config/appref#entrypoint) | (Required) The format should be a shell command that can be fed to bash -c. | -- |
