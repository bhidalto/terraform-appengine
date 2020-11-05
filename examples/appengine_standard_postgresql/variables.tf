### Variables declaration for VPC network
variable "vpc_network_name" {}
variable "routing_mode" {}

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

# Variables for SVPC connector block
variable "svpc_connector_name" {}
variable "ip_cidr_range" {}
variable "region" {}
variable "min_throughput" {}
variable "max_throughput" {}
# /Variables for SVPC connector block

# Variables for Standard Module
variable "service_version" {}
variable "service" {}
variable "runtime" {}
variable "threadsafe" {}
variable "instance_class" {}

# Variables for Zip Module
variable "zip" {}

# Variables for Handlers block
variable "handlers" {}

# Variables for Automatic Scaling module
variable "automatic_scaling" {}

variable "project" {}

# /Variables for Standard Module
