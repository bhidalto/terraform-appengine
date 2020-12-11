resource "google_app_engine_flexible_app_version" "appengine_flexible_manual_scaling" {
  # ===== Required Variables ===== #

  runtime = var.runtime
  readiness_check {
    path              = var.readiness_path
    host              = var.readiness_host
    failure_threshold = var.readiness_failure_threshold
    success_threshold = var.readiness_success_threshold
    check_interval    = var.readiness_check_interval
    timeout           = var.readiness_timeout
    app_start_timeout = var.readiness_app_start_timeout
  }
  liveness_check {
    path              = var.liveness_path
    host              = var.liveness_host
    failure_threshold = var.liveness_failure_threshold
    success_threshold = var.liveness_success_threshold
    check_interval    = var.liveness_check_interval
    timeout           = var.liveness_timeout
    initial_delay     = var.liveness_initial_delay
  }
  service = var.service

  # ===== Optional Variables ===== #

  version_id       = var.service_version
  inbound_services = var.inbound_services
  instance_class   = var.instance_class
  dynamic "network" {
    for_each = var.network[*]
    content {
      forwarded_ports  = network.value.forwarded_ports
      instance_tag     = network.value.instance_tag
      name             = network.value.name
      subnetwork       = network.value.subnetwork
      session_affinity = network.value.session_affinity
    }
  }
  dynamic "resources" {
    for_each = var.resources[*]
    content {
      cpu       = resources.value.cpu
      disk_gb   = resources.value.disk_gb
      memory_gb = resources.value.memory_gb
      dynamic "volumes" {
        for_each = resources.value.volumes == null ? [] : list(resources.value.volumes)
        content {
          name        = volumes.value.name
          volume_type = volumes.value.volume_type
          size_gb     = volumes.value.size_gb
        }
      }
    }
  }
  runtime_channel     = var.runtime_channel
  beta_settings       = var.beta_settings
  serving_status      = var.serving_status
  runtime_api_version = var.api_version
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
  runtime_main_executable_path = var.runtime_main_executable_path
  dynamic "api_config" {
    for_each = var.api_config == null ? [] : list(var.api_config)
    content {
      auth_fail_action = var.api_config[api_config.key]["auth_fail_action"]
      login            = var.api_config[api_config.key]["login"]
      script           = var.api_config[api_config.key]["script"]
      security_level   = var.api_config[api_config.key]["security_level"]
      url              = var.api_config[api_config.key]["url"]
    }
  }
  env_variables       = var.env_variables
  default_expiration  = var.default_expiration
  nobuild_files_regex = var.nobuild_files_regex
  deployment {
    dynamic "zip" {
      for_each = var.zip[*]
      content {
        source_url  = zip.value.source_url
        files_count = zip.value.files_count
      }
    }
    dynamic "files" {
      for_each = var.files == null ? [] : list(var.files)
      content {
        name       = var.files[files.key]["name"]
        sha1_sum   = var.files[files.key]["sha1_sum"]
        source_url = var.files[files.key]["source_url"]
      }
    }
    dynamic "container" {
      for_each = var.container == null ? [] : list(var.container)
      content {
        image = var.container[container.key]["image"]
      }
    }
    dynamic "cloud_build_options" {
      for_each = var.cloud_build_options == null ? [] : list(var.cloud_build_options)
      content {
        app_yaml_path       = var.cloud_build_options[cloud_build_options.key]["app_yaml_path"]
        cloud_build_timeout = var.cloud_build_options[cloud_build_options.key]["cloud_build_timeout"]
      }
    }
  }
  dynamic "endpoints_api_service" {
    for_each = var.endpoints_api_service == null ? [] : list(var.endpoints_api_service)
    content {
      name                   = var.endpoints_api_service[endpoints_api_service.key]["name"]
      config_id              = var.endpoints_api_service[endpoints_api_service.key]["config_id"]
      rollout_strategy       = var.endpoints_api_service[endpoints_api_service.key]["rollout_strategy"]
      disable_trace_sampling = var.endpoints_api_service[endpoints_api_service.key]["disable_trace_sampling"]
    }
  }
  dynamic "entrypoint" {
    for_each = var.entrypoint[*]
    content {
      shell = entrypoint.value.shell
    }
  }
  manual_scaling {
    instances = var.instances
  }
  noop_on_destroy           = var.noop_on_destroy
  delete_service_on_destroy = var.delete_service_on_destroy
  timeouts {
      create = "60m"
      update = "60m"
      delete = "60m"
  }
}