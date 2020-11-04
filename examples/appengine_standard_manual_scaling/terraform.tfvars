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
  url_regex = "/.*",
  security_level              = null,
  login                       = null,
  auth_fail_action            = null,
  redirect_http_response_code = null,
  script = {
    script_path = "main.app"
  }
  static_files = null
}]

# Variables for Manual Scaling block
instances = 5
