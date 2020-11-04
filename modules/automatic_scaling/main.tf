resource "automatic_scaling" "automatic_scaling" {
  max_concurrent_requests     = var.max_concurrent_requests
  max_idle_instances          = var.max_idle_instances
  max_pending_latency         = var.max_pending_latency
  min_idle_instances          = var.min_idle_instances
  min_pending_latency         = var.min_pending_latency
  standard_scheduler_settings = var.standard_scheduler_settings
}