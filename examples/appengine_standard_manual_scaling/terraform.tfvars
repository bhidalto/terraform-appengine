# Variables for Standard Module
service_version           = "1234"
service                   = "terraform-py27"
runtime                   = "python27"
threadsafe                = true
api_version               = 1
env_variables             = null
noop_on_destroy           = true
delete_service_on_destroy = false
inbound_services          = null
instance_class            = "B1"

# Variables for Zip block
zip = {
  source_url  = "https://storage.googleapis.com/javafileswave23/gae-helloworld.zip"
  files_count = null
}

# Variables for Handlers block
handlers = [{
  url_regex                   = "/.*",
  security_level              = "SECURE_DEFAULT",
  login                       = "LOGIN_OPTIONAL",
  auth_fail_action            = "AUTH_FAIL_ACTION_REDIRECT",
  redirect_http_response_code = "REDIRECT_HTTP_RESPONSE_CODE_301",
  script = {
    script_path = "main.app"
  }
  static_files = null
}]

# Variables for Libraries block
libraries = null

# Variables for Entrypoint block
entrypoint = null

# Variables for VPC Access Connector block
vpc_access_connector = null

# Variables for Manual Scaling block
instances = 5
