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
  runtime           = var.runtime
  zip               = var.zip
  service           = var.service
  instance_class    = var.instance_class
  automatic_scaling = var.automatic_scaling
}