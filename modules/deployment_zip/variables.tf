variable "source_url" {
  description = "(Required) URL to the source of the files."
  type        = string
  default     = null
}

variable "files_count" {
  description = "(Optional) Total amount of files that are contained in the zip."
  type        = number
  default     = null
}