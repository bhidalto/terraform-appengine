resource "google_app_engine_standard_app_version" "appengine_standard" {
  version_id                = var.version
  service                   = ver.service
  runtime                   = var.runtime
  threadsafe                = var.threadsafe
  runtime_api_version       = var.api_version
  env_variables             = var.env_variables
  noop_on_destroy           = var.noop_on_destroy
  delete_service_on_destroy = var.delete_service_on_destroy
  inbound_services          = var.inbound_services
  instance_class            = var.instance_class
  project                   = var.project
  deployment                = var.deployment
  handlers                  = var.handlers
  libraries                 = var.libraries
  entrypoint                = var.entrypoint
  automatic_scaling         = var.automatic_scaling
  basic_scaling             = var.basic_scaling
  manual_scaling            = var.manual_scaling


  #TODO
  #vpc_access_connector -> module


  #TODO use modules for scaling options
  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 1
    max_idle_instances      = 3
    min_pending_latency     = "1s"
    max_pending_latency     = "5s"
    standard_scheduler_settings {
      target_cpu_utilization        = 0.5
      target_throughput_utilization = 0.75
      min_instances                 = 2
      max_instances                 = 10
    }
  }
}