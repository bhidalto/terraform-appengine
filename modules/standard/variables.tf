variable "version" {
    description = "Name of the App Engine version of the Service that will be deployed."
    type = string

    validation {
        condition = length(var.version) > 0 && length(var.version) < 63
        error_message = "The version name can't be null and the length cannot exceed 63 characters"
    }
}

variable "service" {
    description = "Name of the App Engine Service"
    type = string
    default = "default"

    validation {
        condition = length(var.service) > 0 && length(var.service) < 63
        error_message = "The Service name can't be null and the length cannot exceed 63 characters"
    }
}

variable "runtime" {
    description = "The runtime that will be used by App Engine. Supported runtimes are: python27, python37, python38, java8, java11, php55, php73, php74, ruby25, go111, go112, go113, go114, nodejs10, nodejs12.\n 
     Defaults to python27."
    type = string
    default = "python27"

    validation {
        condition = contains(["python27", "python37", "python38", "java8", "java11", "php55", "php73", "php74", "ruby25", "go111", "go112", "go113", "go114", "nodejs10", "nodejs12"], var.runtime)
        error_message = 
        "The specified runtime does not match any of the supported runtimes: \n
        - Python: python27, python37, python38 \n
        - Java: java8, java11 \n
        - PHP: php55, php73, php74 \n
        - Ruby: ruby25 \n
        - Go: go111, go112, go113, go114 \n
        - Node.js: nodejs10, nodejs12"
    }
}

variable "threadsafe" {
    description = "Whether the application should use concurrent requests or not. Only appliable for python27 and java8 runtimes. Defaults to true."
    type = bool
    default = true
}

variable "api_version" {
    desription = "The version of the API in the given runtime environment that is used by your app. The field is deprecated for newer App Engine runtimes. Defaults to 1. " 
    type = number
    default = 1
}

variable "env_variables" {
    description = "Environment variables to be passed to the App Engine service"
    type = map
    default = {}
}

variable "noop_on_destroy" {
    description = "If set to true, the application version will not be deleted upon running Terraform destroy. Defaults to true."
    type = bool
    default = true
}

variable "delete_service_on_destroy" {
    description = "If set to true, the service will be deleted if it is the last version. Defaults to false."
    type = bool
    default = false
}