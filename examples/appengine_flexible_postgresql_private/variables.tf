### Variables declaration for VPC network
variable "vpc_network_name" {}
variable "routing_mode" {}
variable "vpc_auto_create_subnetworks_enabled" {}

### Variables declaration for IP address allocation range
variable "allocated_ip_address_range_name" {}
variable "prefix_length" {}

### Variables declaration for Cloud SQL instance
variable "instance_name" {}
variable "sql_region" {}
variable "postgres_version" {}


## Variables declaration for Cloud SQL user
variable "sql_user_name" {}
variable "sql_user_password" {}

## Variables declaration for Cloud SQL Database
variable "database_name" {}

# Variables for Standard Module
variable "runtime" {}
variable "service" {}
variable "service_version" {}
variable "network" {}

# Variables for Zip Module
variable "zip" {}

# Variables for Entrypoint block
variable "entrypoint" {}

# Variables for Manual Scaling module
variable "instances" {}

variable "project" {}

# /Variables for Standard Module
