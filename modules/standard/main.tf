resource "google_app_engine_standard_app_version" "appengine_standard" {
  version_id                = var.service_version
  service                   = var.service
  runtime                   = var.runtime
  threadsafe                = var.threadsafe
  runtime_api_version       = var.api_version
  env_variables             = var.env_variables
  noop_on_destroy           = var.noop_on_destroy
  delete_service_on_destroy = var.delete_service_on_destroy
  inbound_services          = var.inbound_services
  instance_class            = var.instance_class
  project                   = var.project
  deployment {
    dynamic "zip" {
      for_each = var.zip == null ? [] : list(var.zip)
      content {
        source_url  = zip.value.source_url
        files_count = zip.value.files_count
      }
    }
    dynamic "files" {
      for_each = var.files == null ? [] : list(var.files)
      content {
        name       = files.value.name
        sha1_sum   = files.value.sha1_sum
        source_url = files.value.source_url
      }
    }
  }
  dynamic "handlers" {
    for_each = var.handlers == null ? [] : var.handlers
    content {
      url_regex                   = var.handlers[handlers.key]["url_regex"]
      security_level              = var.handlers[handlers.key]["security_level"]
      login                       = var.handlers[handlers.key]["login"]
      auth_fail_action            = var.handlers[handlers.key]["auth_fail_action"]
      redirect_http_response_code = var.handlers[handlers.key]["redirect_http_response_code"]
      dynamic "script" {
        for_each = handlers.value.script == null ? [] : list(handlers.value.script)
        content {
          script_path = script.value.script_path
        }
      }
      dynamic "static_files" {
        for_each = handlers.value.static_files == null ? [] : list(handlers.value.static_files)
        content {
          path                  = static_files.value.path
          upload_path_regex     = static_files.value.upload_path_regex
          http_headers          = static_files.value.http_headers
          mime_type             = static_files.value.mime_type
          expiration            = static_files.value.expiration
          require_matching_file = static_files.value.require_matching_file
          application_readable  = static_files.value.application_readable
        }
      }
    }
  }
  dynamic "libraries" {
    for_each = var.libraries == null ? [] : var.libraries
    content {
      name    = var.libraries[libraries.key]["name"]
      version = var.libraries[libraries.key]["version"]
    }
  }
  dynamic "entrypoint" {
    for_each = var.entrypoint == null ? {} : var.entrypoint
    content {
      shell = var.entrypoint["shell"]
    }
  }
  dynamic "automatic_scaling" {
    for_each = var.automatic_scaling == null ? {} : var.automatic_scaling
    content {
      max_concurrent_requests = var.automatic_scaling["max_concurrent_requests"]
      max_idle_instances      = var.automatic_scaling["max_idle_instances"]
      max_pending_latency     = var.automatic_scaling["max_pending_latency"]
      min_idle_instances      = var.automatic_scaling["min_idle_instances"]
      min_pending_latency     = var.automatic_scaling["min_pending_latency"]
      dynamic "standard_scheduler_settings" {
        for_each = var.automatic_scaling["standard_scheduler_settings"] == null ? {} : var.automatic_scaling["standard_scheduler_settings"]
        content {
          target_cpu_utilization        = standard_scheduler_settings.value.target_cpu_utilization
          target_throughput_utilization = standard_scheduler_settings.value.target_throughput_utilization
          min_instances                 = standard_scheduler_settings.value.min_instances
          max_instances                 = standard_scheduler_settings.value.max_instances
        }
      }
    }
  }
  dynamic "basic_scaling" {
    for_each = var.basic_scaling == null ? [] : list(var.basic_scaling)
    content {
      idle_timeout  = basic_scaling.value.idle_timeout
      max_instances = basic_scaling.value.max_instances
    }
  }
  dynamic "manual_scaling" {
    for_each = var.manual_scaling == null ? [] : list(var.manual_scaling)
    content {
      instances = manual_scaling.value.instances
    }
  }

  dynamic "vpc_access_connector" {
    for_each = var.vpc_access_connector == null ? [] : list(var.vpc_access_connector)
    content {
      name = vpc_access_connector.value.name
    }
  }
}