# Deployment module

This module is intended to easily create Deployment settings for App Engine standard.

## Usage

```
module "deployment" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/deployment"
  zip   = {
      source_url = "https://storage.cloud.google.com/my-bucket/my-zip.zip"
      files_count = 1
  }
  files = {
      name       = "filename.txt"
      sha1_sum   = "d5db29cd03a2ed055086cef9c31c252b4587d6d0"
      source_url = "https://storage.cloud.google.com/my-bucket/filename.txt"
  }
}
```

## Variables

Below is the list of available variables to be used upon creation of the Deployment module.

| Variable | Description | Default value|
| --- | --- | -- |
| [zip](../deployment_zip/) | (Optional) Source zip of files that will be included in the deployment of this version. | -- |
| [files](../deployment_files/) | (Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. | -- |
