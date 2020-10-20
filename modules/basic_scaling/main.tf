resource "basic_scaling_settings" "basic_scaling" {
    idle_timeout = var.idle_timeout
    max_instances = var.max_instances
}