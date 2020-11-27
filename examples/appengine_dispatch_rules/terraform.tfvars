# ===== Variables for App Engine Service ===== #
service_version = "v1"
service         = "new-service"
runtime         = "python27"
threadsafe      = true
instance_class  = "B1"
zip = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-new-service.zip"
  files_count = null
}
handlers = [{
  url_regex                   = "/.*",
  security_level              = null,
  login                       = null,
  auth_fail_action            = null,
  redirect_http_response_code = null,
  script = {
    script_path = "main.app"
  }
  static_files = null
}]
instances = 2
# ===== /Variables for App Engine Service ===== #


# ===== Variables for Dispatch Rules ===== #
domain_new_service = "*"
path_new_service   = "/new"
# ===== /Variables for Dispatch Rules ===== #

# ===== Variables for Dispatch Rules Default Service ===== #
domain_default_service = "*"
path_default_service   = "/*"
service_default        = "default"
# ===== /Variables for Dispatch Rules Default Service ===== #

