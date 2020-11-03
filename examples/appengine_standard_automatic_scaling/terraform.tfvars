# Variables for Standard Module
runtime        = "python27"
service        = "terraform-py27"
instance_class = "F1"

# Variables for Zip Module
zip = {
  source_url  = "https://storage.googleapis.com/javafileswave23/gae-helloworld.zip"
  files_count = null
}

# Variables for Automatic Scaling module
automatic_scaling = {
  max_concurrent_requests = 10,
  max_idle_instances      = 10,
  max_pending_latency     = "30ms",
  min_idle_instances      = 3,
  min_pending_latency     = "0s",
  standard_scheduler_settings = {
    target_cpu_utilization        = 0.6,
    target_throughput_utilization = 0.6,
    min_instances                 = 0,
    max_instances                 = 1
  }
}
