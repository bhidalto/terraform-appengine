resource "standard_scheduler_settings" "standard_scheduler_settings" {
  target_cpu_utilization        = var.target_cpu_utilization
  target_throughput_utilization = var.target_throughput_utilization
  min_instances                 = var.min_instances
  max_instances                 = var.max_instances
}