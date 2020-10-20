resource "google_app_engine_standard_app_version" "appengine_standard" {
  version_id = var.version
  service    = ver.service
  runtime    = var.runtime
  threadsafe = var.threadsafe
  runtime_api_version = var.api_version
  env_variables = var.env_variables
  noop_on_destroy = var.noop_on_destroy
  delete_service_on_destroy = var.delete_service_on_destroy
  
  #TODO
  handlers -> module
  libraries -> module
  entrypoint -> module
  vpc_access_connector -> module
  scaling_settings -> modules
  standard_scheduler_settings -> scaling_settings submodule
  script -> module
  static_files -> module
  deployment -> module
  

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

#TODO use modules for scaling options
  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances = 1
    max_idle_instances = 3
    min_pending_latency = "1s"
    max_pending_latency = "5s"
    standard_scheduler_settings {
      target_cpu_utilization = 0.5
      target_throughput_utilization = 0.75
      min_instances = 2
      max_instances = 10
    }
  }

  delete_service_on_destroy = true
}

resource "google_storage_bucket" "bucket" {
  name = "appengine-static-content"
}

resource "google_storage_bucket_object" "object" {
  name   = "hello-world.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./test-fixtures/appengine/hello-world.zip"
}