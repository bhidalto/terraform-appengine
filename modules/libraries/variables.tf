variable "name" {
  description = "(Optional) Name of the library to be added."
  type        = string
  default     = ""
}

variable "version" {
  description = "(Optional; Default: latest) Version of the library to select."
  type        = string
  default     = "latest"
}