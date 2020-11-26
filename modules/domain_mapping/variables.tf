variable "domain_name" {
  description = "(Required) Relative name of the domain serving the application."
  type        = string
  default     = ""
}

variable "ssl_settings" {
  description = ""
  type = object({
    certificate_id                 = string,
    ssl_management_type            = string,
    pending_managed_certificate_id = string
  })
  default = null

  validation {
    condition     = var.ssl_settings != null ? ! contains([for ssl_management_type in var.ssl_settings[*].ssl_management_type : (ssl_management_type == null || contains(["AUTOMATIC", "MANUAL"], ssl_management_type)) if ssl_management_type != null], false) : true
    error_message = "SSL management type must be one of [AUTOMATIC, MANUAL]."
  }
}

variable "override_strategy" {
  description = "(Optional) Whether the domain creation should override any existing mappings for this domain. By default, overrides are rejected. Possible values are STRICT and OVERRIDE."
  type        = string
  default     = null

  validation {
    condition     = var.override_strategy != null || contains(["STRICT", "OVERRIDE"], var.override_strategy == null ? "" : var.override_strategy)
    error_message = "The override strategy field must be one of [STRICT, OVERRIDE]."
  }
}