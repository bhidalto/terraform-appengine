# URL dispatch rules module

This module is intended to easily create URL dispatch rules for App Engine services by using Terraform.

## Usage

```
module "url_dispatch_rule" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/url_dispatch_rules"
  domain  = "*"
  path    = "/*"
  service = "my-gae-service"
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the Serverless VPC access connector.

| Variable | Description | Default value|
| --- | --- | -- |
| [domain](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#UrlDispatchRule.FIELDS.domain) | (Optional) Domain name to match against. | -- |
| [path](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#UrlDispatchRule.FIELDS.path) | (Required) Pathname within the host. Must start with a `/`. A single `*` can be included at the end of the path. | "/*" |
| [service](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#UrlDispatchRule.FIELDS.service) | (Required) App Engine service to which the dispatch rules should be applied. | -- |


## Outputs

Once the URL dispatch rules have been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `{{project}}` |
