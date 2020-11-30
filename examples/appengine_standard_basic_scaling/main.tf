terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "<= 3.49"
    }
  }
}

provider "google" {
  project = var.project
}

module "appengine_standard_basic_scaling" {
  source          = "../../modules/standard/basic_scaling/"
  service_version = var.service_version
  service         = var.service
  runtime         = var.runtime
  threadsafe      = var.threadsafe
  instance_class  = var.instance_class
  zip             = var.zip
  handlers        = var.handlers
  idle_timeout    = var.idle_timeout
  max_instances   = var.max_instances
}