# ======================== DATA SOURCE DEFINITION ================= #

# It collects the different regions available within GCP.

data "google_compute_regions" "available" {
  # project = var.project_id
}

# ========================= VARIABLE DEFINITION =================== #
variable "project" {
  description = "(Required) The project ID to create the application under. ~>NOTE: GCP only accepts project ID, not project number. If you are using number, you may get a `Permission denied` error."
  type        = string
  default     = ""
}

variable "location_id" {
  description = "(Required) The location to serve the app from."
  type        = string
  default     = ""
}

variable "auth_domain" {
  description = "(Optional) The domain to authenticate users with when using App Engine's User API."
  type        = string
  default     = null
}

variable "database_type" {
  description = "(Optional) The type of the Cloud Firestore or Cloud Datastore database associated with this application. Can be `CLOUD_FIRESTORE` or `CLOUD_DATASTORE_COMPATIBILITY` for new instances."
  type        = string
  default     = null

  validation {
    condition     = var.database_type == null || contains(["CLOUD_FIRESTORE", "CLOUD_DATASTORE_COMPATIBILITY"], var.database_type == null ? "" : var.database_type)
    error_message = "The database type must be one of [CLOUD_FIRESTORE, CLOUD_DATASTORE_COMPATIBILITY]."
  }
}

variable "serving_status" {
  description = "(Optional) The serving status of the app."
  type        = string
  default     = null

  validation {
    condition     = var.serving_status == null || contains(["UNSPECIFIED", "SERVING", "USER_DISABLED", "SYSTEM_DISABLED"], var.serving_status == null ? "" : var.serving_status)
    error_message = "The serving status of the app must be one of [UNSPECIFIED, SERVING, USER_DISABLED, SYSTEM_DISABLED]."
  }
}

variable "feature_settings" {
  description = "(Optional) A block of optional settings to configure specific App Engine features."
  type = object({
    split_health_checks = bool
  })
  default = null
}

variable "iap" {
  description = "(Optional) Settings for enabling Cloud Identity Aware Proxy."
  type = object({
    oauth2_client_id     = string,
    oauth2_client_secret = string
  })
  default = null
}