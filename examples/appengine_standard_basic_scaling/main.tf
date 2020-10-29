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

module "appengine_standard" {
  source  = "../../modules/standard/"
  runtime = var.runtime
  zip = {
    source_url  = var.source_url
    files_count = null
  }
  service        = var.service
  instance_class = var.instance_class
  basic_scaling = {
    idle_timeout  = var.idle_timeout
    max_instances = var.max_instances
  }
  project = var.project
}