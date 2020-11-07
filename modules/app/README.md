# App Engine App module

This module is intended to easily create an App Engine application using Terraform.

## Usage

```
module "appengine_app" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/app"
  project     = "my-project-id"
  location_id = "us-central"
}
```

A detailed example on how to use it can be found [here](../examples/appengine_app).

## Variables

Below is the list of available variables to be used upon creation of the App Engine application.

| Variable | Description | Default value|
| --- | --- | -- |
| [project](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#Application.FIELDS.id) | (Required) The project ID to create the application under. ~>NOTE: GCP only accepts project ID, not project number. If you are using number, you may get a `Permission denied` error. | -- |
| [location_id](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#Application.FIELDS.location_id) | (Required) The location to serve the app from. | -- |
| [auth_domain](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#Application.FIELDS.auth_domain) | (Optional) The domain to authenticate users with when using App Engine's User API. | -- |
| [database_type](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#databasetype) | (Optional) The type of the Cloud Firestore or Cloud Datastore database associated with this application. Can be `CLOUD_FIRESTORE` or `CLOUD_DATASTORE_COMPATIBILITY` for new instances. | -- |
| [serving_status](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#servingstatus) | (Optional) The serving status of the app. | -- |
| [feature_settings](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#featuresettings) | (Optional) A block of optional settings to configure specific App Engine features. | -- |
| [iap](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps#identityawareproxy) | (Optional) Settings for enabling Cloud Identity Aware Proxy. | -- |

## Outputs

Once the App Engine application has been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `{{project}}`. |
| name | Unique name of the app, usually `apps/{PROJECT_ID}`. |
| app_id | Identifier of the app, usually `{PROJECT_ID}`. |
| url_dispatch_rule | A list of dispatch rule blocks. Each block has a `domain`, `path`, and `service` field. |
| code_bucket | The GCS bucket code is being stored in for this app. |
| default_hostname | The default hostname for this app. |
| default_bucket | The GCS bucket content is being stored in for this app. |
| gcr_domain | The GCR domain used for storing managed Docker images for this app. |
| iap | Settings for enabling Cloud Identity Aware Proxy. |
| iap_enabled | (Optional) Whether the serving infrastructure will authenticate and authorize all incoming requests. (default is false). |
| iap_oauth2_client_secret_sha256 | Hex-encoded SHA-256 hash of the client secret. |