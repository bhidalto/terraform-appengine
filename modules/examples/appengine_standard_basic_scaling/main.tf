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

module "basic_scaling" {
  source = "../../basic_scaling/"
  idle_timeout  = var.idle_timeout
  max_instances = var.max_instances
}

module "deployment_zip" {
  source     = "../../deployment_zip/"
  source_url = var.source_url
}

module "deployment" {
  source = "../../deployment/"
  zip = {
    source_url = module.zip.source_url
  }
}

module "appengine_standard" {
  source = "../../standard/"
  runtime = var.runtime
  deployment = {
    zip = module.deployment.zip
  }
  service        = var.service
  instance_class = var.instance_class
  basic_scaling = {
    idle_timeout  = module.basic_scaling.idle_timeout
    max_instances = module.basic_scaling.max_instances
  }
  project = var.project
}