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

module "standard_service_v1" {
  source          = "../../modules/standard/manual_scaling/"
  service_version = var.service_version_v1
  service         = var.service
  runtime         = var.runtime_v1
  threadsafe      = var.threadsafe_v1
  instance_class  = var.instance_class_v1
  zip             = var.zip_v1
  handlers        = var.handlers_v1
  instances       = var.instances_v1
}

module "standard_service_v2" {
  source          = "../../modules/standard/manual_scaling/"
  service_version = var.service_version_v2
  service         = var.service
  runtime         = var.runtime_v2
  threadsafe      = var.threadsafe_v2
  instance_class  = var.instance_class_v2
  zip             = var.zip_v2
  handlers        = var.handlers_v2
  instances       = var.instances_v2
}

module "appengine_service_split_traffic" {
  depends_on      = [module.standard_service_v1, module.standard_service_v2]
  source          = "../../modules/split_traffic"
  service         = var.service
  shard_by        = var.shard_by
  allocations     = var.allocations
  migrate_traffic = var.migrate_traffic
}