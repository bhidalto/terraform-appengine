# Handler's Static Files module

This module is intended to easily create a Static Files module for the Handlers module.

## Usage

```
module "handler_static_files" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/handler_static_files"
  path                  = "static/\1"
  upload_path_regex     = "static/.*\.(gif|png|jpg)$"
  http_headers          = {
      X-Foo-Header: foo
      X-Bar-Header: bar value
  }
  mime_type             = "application/json"
  expiration            = "600s"
  require_matching_file = false
  application_readable  = false
}
```

## Variables

Below is the list of available variables to be used upon creation of the Handler Script module.

| Variable | Description | Default value|
| --- | --- | -- |
| [path](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_static_files) | (Optional) Path to the static files matched by the URL pattern, from the application root directory. The path can refer to text matched in groupings in the URL pattern. | -- |
| [upload_path_regex](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_upload) | (Optional) Regular expression that matches the file paths for all files that should be referenced by this handler. | -- |
| [http_headers](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_http_headers) | (Optional) HTTP headers to use for all responses from these URLs. An object containing a list of "key:value" value pairs.". | -- |
| [mime_type](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_mime_type) | (Optional) MIME type used to serve all files served by this handler. Defaults to file-specific MIME types, which are derived from each file's filename extension. | -- |
| [expiration](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_expiration) | (Optional) Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s". | "600s" |
| require_matching_file | (Optional) Whether this handler should match the request if the file referenced by the handler does not exist. | false |
| [application_readable](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_application_readable) | (Optional) Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. | false |
