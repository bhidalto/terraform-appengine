variable "zip" {
  description = "(Optional) Source zip of files that will be included in the deployment of this version."
  type = list(object({
    source_url  = string,
    files_count = number
  }))
  default = null
}

variable "files" {
  description = "(Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call."
  type = list(object({
    name       = string,
    sha1_sum   = string,
    source_url = string
  }))
  default = null
}