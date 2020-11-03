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
  source         = "../../modules/standard/manual_scaling/"
  runtime        = var.runtime
  zip            = var.zip
  service        = var.service
  instance_class = var.instance_class
  instances      = var.instances
}