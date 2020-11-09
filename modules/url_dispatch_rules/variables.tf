variable "domain" {
  description = "(Optional) Domain name to match against."
  type        = string
  default     = null
}

variable "path" {
  description = "(Required; Default: /*) Pathname within the host. Must start with a `/`. A single `*` can be included at the end of the path."
  type        = string
  default     = "/*"

  validation {
    condition     = length(regexall("^/", var.path)) > 0
    error_message = "The path must start with `/`."
  }
}

variable "service" {
  description = "(Required) App Engine service to which the dispatch rules should be applied."
  type        = string
  default     = ""
}