variable "url_regex" {
  description = "(Optional) URL prefix. Uses regular expression syntax, which means regexp special characters must be escaped, but should not contain groupings. All URLs that begin with this prefix are handled by this handler, using the portion of the URL after the prefix as part of the file path."
  type        = string
  default     = ""
}

variable "security_level" {
  description = "(Optional; Default: SECURE_DEFAULT) Security (HTTPS) enforcement for this URL"
  type        = string
  default     = "SECURE_DEFAULT"

  validation {
    condition     = contains([SECURE_DEFAULT, SECURE_NEVER, SECURE_OPTIONAL, SECURE_ALWAYS], var.security_level)
    error_message = "Security level field value must be one of [SECURE_DEFAULT, SECURE_NEVER, SECURE_OPTIONAL, SECURE_ALWAYS]."
  }
}

variable "login" {
  description = "(Optional; Default: LOGIN_OPTIONAL) Methods to restrict access to a URL based on login status. This field is not available in newer App Engine runtimes."
  type        = string
  default     = "LOGIN_OPTIONAL"

  validation {
    condition     = contains([LOGIN_OPTIONAL, LOGIN_ADMIN, LOGIN_REQUIRED], var.login)
    error_message = "Login field value must be one of [LOGIN_OPTIONAL, LOGIN_ADMIN, LOGIN_REQUIRED]."
  }
}

variable "auth_fail_action" {
  description = "(Optional; Default: AUTH_FAIL_ACTION_REDIRECT)Actions to take when the user is not logged in"
  type        = string
  default     = "AUTH_FAIL_ACTION_REDIRECT"

  validation {
    condition     = contains([AUTH_FAIL_ACTION_REDIRECT, AUTH_FAIL_ACTION_UNAUTHORIZED], var.auth_fail_action)
    error_message = "Auth fail action field value must be one of [AUTH_FAIL_ACTION_REDIRECT,AUTH_FAIL_ACTION_UNAUTHORIZED]."
  }
}

variable "redirect_http_response_code" {
  description = "(Optional; Default: REDIRECT_HTTP_RESPONSE_CODE_301) 30x code to use when performing redirects for the secure field."
  type        = string
  default     = "REDIRECT_HTTP_RESPONSE_CODE_301"

  validation {
    condition     = contains([REDIRECT_HTTP_RESPONSE_CODE_301, REDIRECT_HTTP_RESPONSE_CODE_302, REDIRECT_HTTP_RESPONSE_CODE_303, REDIRECT_HTTP_RESPONSE_CODE_307], var.redirect_http_response_code)
    error_message = "Redirect HTTP response code field value must be one of [REDIRECT_HTTP_RESPONSE_CODE_301, REDIRECT_HTTP_RESPONSE_CODE_302, REDIRECT_HTTP_RESPONSE_CODE_303, REDIRECT_HTTP_RESPONSE_CODE_307]."
  }
}

variable "script" {
  description = "(Optional) Executes a script to handle the requests that match this URL pattern. Only the auto value is supported for Node.js in the App Engine standard environment, for example `script:` `auto`."
  type = list(object({
    script_path = string
  }))
  default = null
}

variable "static_files" {
  description = "(Optional) Files served directly to the user for a given URL, such as images, CSS stylesheets, or JavaScript source files. Static file handlers describe which files in the application directory are static files, and which URLs serve them."
  type = list(object({
    path                  = string
    upload_path_regex     = string
    http_headers          = map()
    mime_type             = string
    expiration            = string
    require_matching_file = bool
    application_readable  = bool
  }))
  default = null
}