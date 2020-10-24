# Deployment Zip module

This module is intended to easily create Zip settings for the [Deployment module](../deployment/).

## Usage

```
module "deployment_zip" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/deployment_zip"
  source_url  = "https://storage.cloud.google.com/my-bucket/my-zip.zip"
  files_count = 1
}
```

## Variables

Below is the list of available variables to be used upon creation of the Deployment Zip module.

| Variable | Description | Default value|
| --- | --- | -- |
| source_url | (Required) URL to the source of the files. | -- |
| files_count | (Optional) Total amount of files that are contained in the zip. | -- |
