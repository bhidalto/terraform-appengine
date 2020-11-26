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

module "standard_service" {
  source          = "../../modules/standard/manual_scaling"
  service_version = var.service_version
  service         = var.service
  runtime         = var.runtime
  threadsafe      = var.threadsafe
  instance_class  = var.instance_class
  zip             = var.zip
  handlers        = var.handlers
  instances       = var.instances
}


module "appengine_dispatch_rules_new_service" {
  depends_on = [module.standard_service]
  source     = "../../modules/url_dispatch_rules"
  domain     = var.domain_new_service
  path       = var.path_new_service
  service    = var.service
}

module "appengine_dispatch_rules_default_service" {
  depends_on = [module.standard_service]
  source     = "../../modules/url_dispatch_rules"
  domain     = var.domain_default_service
  path       = var.path_default_service
  service    = var.service_default
}