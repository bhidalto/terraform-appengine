# ===== Variables for App Engine Service V1 ===== #
variable "service_version_v1" {}
variable "runtime_v1" {}
variable "threadsafe_v1" {}
variable "instance_class_v1" {}
variable "zip_v1" {}
variable "handlers_v1" {}
variable "instances_v1" {}
# ===== /Variables for App Engine Service V1 ===== #


# ===== Variables for App Engine Service V2 ===== #
variable "service_version_v2" {}
variable "runtime_v2" {}
variable "threadsafe_v2" {}
variable "instance_class_v2" {}
variable "zip_v2" {}
variable "handlers_v2" {}
variable "instances_v2" {}
# ===== /Variables for App Engine Service V2 ===== #


# ===== Variables for Split Traffic ===== #
variable "shard_by" {}
variable "allocations" {}
variable "migrate_traffic" {}
# ===== /Variables for Split Traffic ===== #

# ===== Generic Variables ===== #
variable "project" {}
variable "service" {}