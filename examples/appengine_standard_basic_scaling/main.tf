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

module "appengine_standard_basic_scaling" {
  source         = "../../modules/standard/basic_scaling/"
  runtime        = var.runtime
  zip            = var.zip
  service        = var.service
  instance_class = var.instance_class
  idle_timeout   = var.idle_timeout
  max_instances  = var.max_instances
  project        = var.project
}