# Handlers module

This module is intended to easily create a Handlers module for the App Engine standard Module.

## Usage

```
module "handlers" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/handlers"
  url_regex                   = "/(.*\.(gif|png|jpg))$"
  security_level              = "SECURE_DEFAULT"
  login                       = "LOGIN_OPTIONAL"
  auth_fail_action            = "AUTH_FAIL_ACTION_REDIRECT"
  redirect_http_response_code = "REDIRECT_HTTP_RESPONSE_CODE_301"
  script                      = "my/path/to/script.py"
  static_files                = {
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
}
```

## Variables

Below is the list of available variables to be used upon creation of the Handler Script module.

| Variable | Description | Default value|
| --- | --- | -- |
| [url_regex](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_url) | (Optional) URL prefix. Uses regular expression syntax, which means regexp special characters must be escaped, but should not contain groupings. All URLs that begin with this prefix are handled by this handler, using the portion of the URL after the prefix as part of the file path. | -- |
| [security_level](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_secure) | (Optional) Security (HTTPS) enforcement for this URL. Mut be one of the following values [`SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`]. | "SECURE_DEFAULT" |
| [login](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_login) | (Optional) Methods to restrict access to a URL based on login status. This field is not available in newer App Engine runtimes. Must be one of the following values [`LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`].| "LOGIN_OPTIONAL" |
| [auth_fail_action](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_auth_fail_action) | (Optional) Actions to take when the user is not logged in. Must be one of the following values [`AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`]. | "AUTH_FAIL_ACTION_REDIRECT" |
| [redirect_http_response_code](https://cloud.google.com/appengine/docs/standard/python/config/appref#handlers_redirect_http_response_code) | (Optional) 30x code to use when performing redirects for the secure field. Must be one of the following values [`REDIRECT_HTTP_RESPONSE_CODE_301`,`REDIRECT_HTTP_RESPONSE_CODE_302`, `REDIRECT_HTTP_RESPONSE_CODE_303`, `REDIRECT_HTTP_RESPONSE_CODE_307`].| "REDIRECT_HTTP_RESPONSE_CODE_301" |
| require_matching_file | (Optional) Whether this handler should match the request if the file referenced by the handler does not exist. | false |
| [script](../handler_script/) | (Optional) Executes a script to handle the requests that match this URL pattern. Only the auto value is supported for Node.js in the App Engine standard environment, for example `script:` `auto`. | -- |
| [static_files](../handler_static_files/) | (Optional) Files served directly to the user for a given URL, such as images, CSS stylesheets, or JavaScript source files. Static file handlers describe which files in the application directory are static files, and which URLs serve them. | -- |
