terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.project
}

module "appengine_standard_manual_scaling" {
  source                    = "../../modules/standard/manual_scaling/"
  service_version           = var.service_version
  service                   = var.service
  runtime                   = var.runtime
  threadsafe                = var.threadsafe
  api_version               = var.api_version
  env_variables             = var.env_variables
  noop_on_destroy           = var.noop_on_destroy
  delete_service_on_destroy = var.delete_service_on_destroy
  inbound_services          = var.inbound_services
  instance_class            = var.instance_class
  zip                       = var.zip
  handlers                  = var.handlers
  instances                 = var.instances
}