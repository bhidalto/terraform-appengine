variable "name" {
  description = "Name of the file stored in Google Cloud Storage that are included as part of this version."
  type        = string
  default     = null
}

variable "sha1_sum" {
  description = "(Optional) SHA1 checksum of the file that will be uploaded."
  type        = string
  default     = null
}

variable "source_url" {
  description = "URL of the file stored in Google Cloud Storage."
  type        = string
  default     = null
}