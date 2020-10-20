variable "max_concurrent_requests" {
  description = "Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to 10."
  type        = number
  default     = 10

  validation {
    condition     = var.max_concurrent_requests >= 10 && var.max_concurrent_requests <= 80
    error_message = "The value of max_concurrent_requests must fall within range [10, 80]"
  }
}

variable "max_idle_instances" {
  description = "Maximum number of idle instances that should be maintained for this version. Defaults to automatic."
  type        = any
  default     = "automatic"

  validation {
    condition     = var.max_idle_instances == "automatic" || (var.max_idle_instances >= 1 && var.max_idle_instances <= 1000)
    error_message = "The value of max_idle_instances needs to be `automatic` or fall within range [1, 1000]"
  }
}

variable "max_pending_latency" {
  description = "Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. Defaults to 30ms."
  type        = string
  default     = "30ms"
}

variable "min_idle_instances" {
  description = "Minimum number of idle instances that should be maintained for this version. Defaults to automatic."
  type        = any
  default     = "automatic"

  validation {
    condition     = var.min_idle_instances == "automatic" || (var.min_idle_instances >= 1 && var.min_idle_instances <= 1000)
    error_message = "The value of min_idle_instances needs to be `automatic` or fall within range [1, 1000]"
  }
}

variable "min_pending_latency" {
  description = "Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. Defaults to 0."
  type        = string
  default     = "0s"
}

variable "standard_scheduler_settings" {
  description = "Scheduler settings for standard environment. Allows to specify the minimum and maximum amount of instances as well as the target CPU and throughput."
  type = list(object({
    target_cpu_utilization        = number,
    target_throughput_utilization = number,
    min_instances                 = number,
    max_instances                 = number,
  }))
  default = null
}