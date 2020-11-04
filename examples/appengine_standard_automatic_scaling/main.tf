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

module "appengine_standard_automatic_scaling" {
  source            = "../../modules/standard/automatic_scaling/"
  service_version   = var.service_version
  service           = var.service
  runtime           = var.runtime
  threadsafe        = var.threadsafe
  instance_class    = var.instance_class
  zip               = var.zip
  handlers          = var.handlers
  automatic_scaling = var.automatic_scaling
}