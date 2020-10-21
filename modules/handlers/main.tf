resource "handlers" "handlers" {
  url_regex                   = var.url_regex
  security_level              = var.security_level
  login                       = var.login
  auth_fail_action            = var.auth_fail_action
  redirect_http_response_code = var.redirect_http_response_code
  script                      = var.script
  static_files                = var.static_files
}