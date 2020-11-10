resource "google_app_engine_service_split_traffic" "split_traffic" {
  service = var.service
  split {
    shard_by    = var.shard_by
    allocations = var.allocations
  }
  migrate_traffic = var.migrate_traffic
}