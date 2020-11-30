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

module "appengine_standard_manual_scaling" {
  source          = "../../modules/standard/manual_scaling/"
  service_version = var.service_version
  service         = var.service
  runtime         = var.runtime
  threadsafe      = var.threadsafe
  instance_class  = var.instance_class
  zip             = var.zip
  handlers        = var.handlers
  instances       = var.instances
}