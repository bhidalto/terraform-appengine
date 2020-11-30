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

module "appengine_firewall_rule" {
  source       = "../../modules/firewall_rule"
  source_range = var.source_range
  action       = var.action
  description  = var.description
  priority     = var.priority
}