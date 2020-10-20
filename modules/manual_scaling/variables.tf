variable "instances" {
    description = "The number of instances to create for the Service. Defaults to 1."
    type = number
    default = 1

    validation {
        condition = var.instances > 0
        error_message = "You must allocate at least 1 instance."
    }
}