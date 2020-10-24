# Deployment Files module

This module is intended to easily create File settings for the [Deployment module](../deployment/).

## Usage

```
module "deployment_files" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/deployment_files"
  name       = "filename.txt"
  sha1_sum   = "d5db29cd03a2ed055086cef9c31c252b4587d6d0"
  source_url = "https://storage.cloud.google.com/my-bucket/filename.txt"
}
```

## Variables

Below is the list of available variables to be used upon creation of the Deployment Files module.

| Variable | Description | Default value|
| --- | --- | -- |
| name | (Required) Name of the file stored in Google Cloud Storage that are included as part of this version. | -- |
| sha1_sum | (Optional) SHA1 checksum of the file that will be uploaded. | -- |
| source_url | (Required) URL of the file stored in Google Cloud Storage. | -- |
