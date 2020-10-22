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
  vpc_access_connector      = var.vpc_access_connector
}