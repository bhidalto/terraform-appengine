# Variables for Standard Module
variable "service_version" {}
variable "service" {}
variable "runtime" {}
variable "threadsafe" {}
variable "api_version" {}
variable "env_variables" {}
variable "noop_on_destroy" {}
variable "delete_service_on_destroy" {}
variable "inbound_services" {}
variable "instance_class" {}

# Variables for Zip block
variable "zip" {}

# Variables for Handlers block
variable "handlers" {}

# Variables for Manual Scaling bloc
variable "instances" {}

variable "project" {}