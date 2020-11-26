# ===== Variables for App Engine Service ===== #
variable "service_version" {}
variable "service" {}
variable "runtime" {}
variable "threadsafe" {}
variable "instance_class" {}
variable "zip" {}
variable "handlers" {}
variable "instances" {}
# ===== /Variables for App Engine Service V1 ===== #

# ===== Variables for Dispatch Rules New Service===== #
variable "domain_new_service" {}
variable "path_new_service" {}
# ===== /Variables for Dispatch Rules New Service ===== #

# ===== Variables for Dispatch Rules Default Service ===== #
variable "domain_default_service" {}
variable "path_default_service" {}
variable "service_default" {}
# ===== /Variables for Dispatch Rules Default Service ===== #

# ===== Generic Variables ===== #
variable "project" {}
