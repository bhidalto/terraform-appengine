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

module "appengine_domain_mapping" {
  source       = "../../modules/domain_mapping"
  domain_name  = var.domain_name
  ssl_settings = var.ssl_settings
}