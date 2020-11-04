# Variables for Standard Module
service_version = "py1234"
service         = "terraform-py27"
runtime         = "python27"
threadsafe      = true
instance_class  = "F1"

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

# Variables for Automatic Scaling module
automatic_scaling = {
  max_concurrent_requests = 10,
  max_idle_instances      = 10,
  max_pending_latency     = "1s",
  min_idle_instances      = 3,
  min_pending_latency     = "0.01s",
  standard_scheduler_settings = {
    target_cpu_utilization        = 0.6,
    target_throughput_utilization = 0.6,
    min_instances                 = 0,
    max_instances                 = 1
  }
}
