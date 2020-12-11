terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "<= 3.43"
    }
  }
}

provider "google" {
  project = var.project
}

# ==== VPC network definition ==== #

module "vpc_network" {
  source                              = "git::https://github.com/crodriguezconde/terraform-google-cloud-sql.git//modules/vpc_network?ref=v0.0.2"
  vpc_network_name                    = var.vpc_network_name
  vpc_description                     = "VPC network created to house the CSQL instance private IP."
  routing_mode                        = var.routing_mode
  vpc_auto_create_subnetworks_enabled = var.vpc_auto_create_subnetworks_enabled
}

# ==== Allocated IP range definition ==== #

module "allocated_ip_address_range" {
  source                    = "git::https://github.com/crodriguezconde/terraform-google-cloud-sql.git//modules/allocated_ip_address_range?ref=v0.0.2"
  name                      = var.allocated_ip_address_range_name
  description               = "Allocation for the Cloud SQL instance."
  prefix_length             = var.prefix_length
  address_type              = "INTERNAL"
  purpose                   = "VPC_PEERING"
  associated_vpc_network_id = module.vpc_network.vpc_network_id
}

module "private_connection" {
  source                      = "git::https://github.com/crodriguezconde/terraform-google-cloud-sql.git//modules/private_connection?ref=v0.0.2"
  associated_vpc_network_id   = module.vpc_network.vpc_network_id
  allocated_ip_address_ranges = [module.allocated_ip_address_range.name]
}

# ==== Cloud SQL Postgres instance ==== #

module "private_postgres_instance" {
  depends_on       = [module.private_connection]
  source           = "git::https://github.com/crodriguezconde/terraform-google-cloud-sql.git//modules/cloud_sql_postgres?ref=v0.0.2"
  name             = var.instance_name
  database_version = var.postgres_version
  cloud_sql_region = var.sql_region
  # We are disabling the Public IP from the Cloud SQL instance as
  # we only want to access it through private IP address.
  ipv4_enabled   = false
  vpc_network_id = module.vpc_network.vpc_network_id
}

# ==== Cloud SQL User ==== #

module "cloud_sql_user" {
  source = "git::https://github.com/crodriguezconde/terraform-google-cloud-sql.git//modules/cloud_sql_user?ref=v0.0.2"

  sql_user_name           = var.sql_user_name
  cloud_sql_instance_name = module.private_postgres_instance.name
  # For PostgreSQL instances, we need to define a password in order to successfully create a new user.
  sql_user_password = var.sql_user_password
}

# ==== Cloud SQL Database ==== #

module "cloud_sql_database" {
  depends_on    = [module.private_postgres_instance]
  source        = "git::https://github.com/crodriguezconde/terraform-google-cloud-sql.git//modules/cloud_sql_database?ref=v0.0.2"
  database_name = var.database_name
  instance_name = module.private_postgres_instance.name
}

# ==== App Engine Flexible Manual Scaling ==== #

module "appengine_flexbile_manual_scaling" {
  depends_on      = [module.private_postgres_instance, module.cloud_sql_database]
  source          = "../../modules/flexible/manual_scaling/"
  runtime         = var.runtime
  service         = var.service
  service_version = var.service_version
  network         = var.network
  beta_settings   = { cloud_sql_instances : module.private_postgres_instance.connection_name }
  env_variables   = { CLOUD_SQL_CONNECTION_NAME : module.private_postgres_instance.connection_name, DB_USER : var.sql_user_name, DB_PASS : var.sql_user_password, DB_NAME : var.database_name, DB_HOST: "172.17.0.1:5432" }
  zip             = var.zip
  entrypoint      = var.entrypoint
  instances       = var.instances
}

