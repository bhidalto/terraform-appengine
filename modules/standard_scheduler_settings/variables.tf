variable "target_cpu_utilization" {
  description = "(Optional; Default: 0.6) Target CPU utilization ratio to maintain when scaling. When the CPU utilisation bypasses this threshold, a new instance will be spin up."
  type        = number
  default     = 0.6

  validation {
    condition     = var.target_cpu_utilization >= 0.5 && var.target_cpu_utilization <= 0.95
    error_message = "The target_cpu_utilization value must fall within range [0.5, 0.95]"
  }
}

variable "target_throughput_utilization" {
  description = "(Optional; Default: 0.6) Target throughput utilization ratio to maintain when scaling. When the target_throughput_utilization threshold is bypassed, a new instance is spun up."
  type        = number
  default     = 0.6

  validation {
    condition     = var.target_throughput_utilization >= 0.5 && var.target_throughput_utilization <= 0.95
    error_message = "The target_throughput_utilization value must fall within range [0.5, 0.95]"
  }
}

variable "min_instances" {
  description = "(Optional; Default: 0) Minimum number of instances to run for this version. Value can be set to 0 for the system to downscale in case of no traffic being served."
  type        = number
  default     = 0

  validation {
    condition     = var.min_instances >= 0 && var.min_instances <= 1000
    error_message = "The min_instances value must fall within range [0,1000]"
  }
}

variable "max_instances" {
  description = "(Optional; Default: 1) Maximum number of instances to run for this version. Specifying a value of 0 disables the setting."
  type        = number
  default     = 1

  validation {
    condition     = var.max_instances >= 0 && var.max_instances <= 2147483647
    error_message = "The max_instances value must fall within range [0,2147483647]"
  }
}