resource "handler_static_files" "handler_static_files" {
  path                  = var.path
  upload_path_regex     = var.upload_path_regex
  http_headers          = var.http_headers
  mime_type             = var.mime_type
  expiration            = var.expiration
  require_matching_file = var.require_matching_file
  application_readable  = var.application_readable
}