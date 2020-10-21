variable "path" {
  description = "(Optional) Path to the static files matched by the URL pattern, from the application root directory. The path can refer to text matched in groupings in the URL pattern."
  type        = string
  default     = ""
}

variable "upload_path_regex" {
  description = "(Optional) Regular expression that matches the file paths for all files that should be referenced by this handler."
  type        = string
  default     = ""
}

variable "http_headers" {
  description = "(Optional) HTTP headers to use for all responses from these URLs. An object containing a list of `key:value` value pairs."
  type        = map(any)
  default     = {}
}

variable "mime_type" {
  description = "(Optional) MIME type used to serve all files served by this handler. Defaults to file-specific MIME types, which are derived from each file's filename extension"
  type        = string
  default     = ""
}

variable "expiration" {
  description = "(Optional; Default: 600s) Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example `3.5s`"
  type        = string
  default     = "600s"
}

variable "require_matching_file" {
  description = "(Optional; Default: false) Whether this handler should match the request if the file referenced by the handler does not exist."
  type        = bool
  default     = false
}

variable "application_readable" {
  description = "(Optional; Default: false) Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. This field is deprecated in newer App Engine runtimes."
  type        = bool
  default     = false
}