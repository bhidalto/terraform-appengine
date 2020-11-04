# Variables for Standard Module
service_version = "py1234"
service         = "terraform-py27"
runtime         = "python27"
threadsafe      = true
instance_class  = "B1"

# Variables for Zip Module
zip = {
  source_url  = "https://storage.googleapis.com/javafileswave23/gae-helloworld.zip"
  files_count = null
}

# Variables for Handlers block
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

# Variables for Basic Scaling module
idle_timeout  = "30s"
max_instances = 5
