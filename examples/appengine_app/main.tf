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

module "appengine_app" {
  source        = "../../modules/app"
  project       = var.project
  location_id   = var.location_id
  database_type = var.database_type
}