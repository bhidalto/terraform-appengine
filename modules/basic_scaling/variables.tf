variable "idle_timeout" {
    description = "Duration of time after the last request that an instance must wait before the instance is shut down. Default is 5minutes (300s)"
    type = string
    default = "300s"
}

variable "max_instances" {
    description = "Maximum number of instances to create for this version. Defaults to 1."
    type = number
    default = 1

    validation {
        condition = var.max_instances >= 1 && var.max_instances <= 200
        error_message = "The number of max instances needs to be in the range [1,200]"
    }
}