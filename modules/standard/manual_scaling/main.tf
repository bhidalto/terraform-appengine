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
    for_each = var.entrypoint[*]
    content {
      shell = entrypoint.value.shell
    }
  }

  manual_scaling {
    instances = var.instances
  }

  dynamic "vpc_access_connector" {
    for_each = var.vpc_access_connector[*]
    content {
      name = vpc_access_connector.value.name
    }
  }
}