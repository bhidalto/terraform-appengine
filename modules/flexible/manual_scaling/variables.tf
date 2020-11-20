# ===== Required Variables ===== #
variable "runtime" {
  description = "(Required; Default: python27) The runtime that will be used by App Engine. Supported runtimes are: python27, python37, python38, java8, java11, php55, php73, php74, ruby25, go111, go112, go113, go114, nodejs10, nodejs12."
  type        = string
  default     = "python27"

  validation {
    condition     = contains(["python27", "python37", "python38", "java8", "java11", "php55", "php73", "php74", "ruby25", "go111", "go112", "go113", "go114", "nodejs10", "nodejs12"], var.runtime)
    error_message = "The specified runtime does not match any of the supported runtimes: \n - Python: python27, python37, python38 \n - Java: java8, java11 \n - PHP: php55, php73, php74 \n - Ruby: ruby25 \n - Go: go111, go112, go113, go114 \n - Node.js: nodejs10, nodejs12."
  }
}
# ===== Readiness Check Variables ===== #
variable "readiness_path" {
  description = "(Required; Default "/readiness") The request path."
  type        = string
  default     = "/readiness"
}

variable "readiness_host" {
  description = "(Optional) Host header to send when performing a HTTP Readiness check."
  type        = string
  default     = null
}

variable "readiness_failure_threshold" {
  description = "(Optional; Default 2) Number of consecutive failed checks required before removing traffic."
  type        = number
  default     = 2
}

variable "readiness_success_threshold" {
  description = "(Optional; Default 2) Number of consecutive successful checks required before receiving traffic."
  type        = number
  default     = 2
}

variable "readiness_check_interval" {
  description = "(Optional; Default "5s") Interval between health checks."
  type        = string
  default     = "5s"
}

variable "readiness_timeout" {
  description = "(Optional; Default "4s") Time before the check is considered failed."
  type        = string
  default     = "4s"
}

variable "readiness_app_start_timeout" {
  description = "(Optional; Default "300s") A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic."
  type        = string
  default     = "300s"
}
# ===== /Readiness Check Variables ===== #

# ===== Liveness Check Variables ===== #
variable "liveness_path" {
  description = "(Required; Default "/liveness") The request path."
  type        = string
  default     = "/liveness"
}

variable "liveness_host" {
  description = "(Optional) Host header to send when performing a HTTP Readiness check."
  type        = string
  default     = null
}

variable "liveness_failure_threshold" {
  description = "(Optional; Default 4) Number of consecutive failed checks required before removing traffic."
  type        = number
  default     = 4
}

variable "liveness_success_threshold" {
  description = "(Optional; Default 2) Number of consecutive successful checks required before receiving traffic."
  type        = number
  default     = 2
}

variable "liveness_check_interval" {
  description = "(Optional; Default "5s") Interval between health checks."
  type        = string
  default     = "5s"
}

variable "liveness_timeout" {
  description = "(Optional; Default "4s") Time before the check is considered failed."
  type        = string
  default     = "4s"
}

variable "liveness_initial_delay" {
  description = "(Optional; Default "300s") A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic."
  type        = string
  default     = "300s"
}
# ===== /Liveness Check Variables ===== #

variable "service" {
  description = "(Required; Default: default) Name of the App Engine Service"
  type        = string
  default     = "default"

  validation {
    condition     = length(var.service) > 0 && length(var.service) < 63
    error_message = "The Service name can't be null and the length cannot exceed 63 characters."
  }
}

# ===== Optional Variables ===== #

variable "service_version" {
  description = "(Optional) Name of the App Engine version of the Service that will be deployed."
  type        = string
  default     = null

  validation {
    condition     = var.service_version == null || length(var.service_version == null ? "" : var.service_version) > 0 && length(var.service_version == null ? "" : var.service_version) < 63
    error_message = "The version name can't be empty and the length cannot exceed 63 characters."
  }
}

variable "inbound_services" {
  description = "(Optional) A list of the types of messages that this application is able to receive."
  type        = list(string)
  default     = null

  validation {
    condition     = var.inbound_services == null || contains(["INBOUND_SERVICE_MAIL", "INBOUND_SERVICE_MAIL_BOUNCE", "INBOUND_SERVICE_XMPP_ERROR", "INBOUND_SERVICE_XMPP_MESSAGE", "INBOUND_SERVICE_XMPP_SUBSCRIBE", "INBOUND_SERVICE_XMPP_PRESENCE", "INBOUND_SERVICE_CHANNEL_PRESENCE", "INBOUND_SERVICE_WARMUP"], (var.inbound_services == null ? [] : var.inbound_services))
    error_message = "Inbound services must be a list with any of the following values [INBOUND_SERVICE_MAIL, INBOUND_SERVICE_MAIL_BOUNCE, INBOUND_SERVICE_XMPP_ERROR, INBOUND_SERVICE_XMPP_MESSAGE, INBOUND_SERVICE_XMPP_SUBSCRIBE, INBOUND_SERVICE_XMPP_PRESENCE, INBOUND_SERVICE_CHANNEL_PRESENCE, INBOUND_SERVICE_WARMUP]."
  }
}

variable "instance_class" {
  description = "(Optional; Default: F1) Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen."
  type        = string
  default     = "F1"

  validation {
    condition     = contains(["B1", "B2", "B4", "B4_1G", "B8", "F1", "F2", "F4", "F4_1G"], var.instance_class)
    error_message = "Instance class must be one of [B1, B2, B4, B4_1G, B8] for BasicScaling or ManualScaling and one of [F1, F2, F4, F4_1G] for AutomaticScaling."
  }
}

variable "network" {
  description = "(Optional) Extra network settings to be defined for the App Engine service."
  type = object({
    forwarded_ports  = list(string),
    instance_tag     = string,
    name             = string,
    subnetwork       = string,
    session_affinity = bool
  })
  default = null
}

variable "resources" {
  description = "(Optional) Machine resources for a version."
  type = object({
    cpu       = number,
    disk_gb   = number,
    memory_gb = number,
    volumes = list(object({
      name        = string,
      volume_type = string,
      size_gb     = number
    }))
  })
  default = null

  validation {
    condition     = var.resources != null ? (var.resources.cpu == 1 || (var.resources.cpu >= 2 && var.resources.cpu <= 96 && var.resources.cpu / 2 == 0)) : true
    error_message = "CPU must be 1 or an even number between 2 and 96."
  }

  validation {
    condition     = var.resources != null ? (var.resources.disk_gb >= 10 && var.resources.disk_gb <= 10240) : true
    error_message = "Disk size must be between 10GB and 10240GB."
  }

  validation {
    condition     = var.resources != null ? (var.resources.volumes != null ? length(var.resources.volumes["name"]) >= 1 && length(var.resources.volumes["name"]) <= 63 && length(regexall("^[A-z][[:word:]-]+[[:alnum:]]$", var.resources.volumes["name"])) > 0 : true) : true
    error_message = "Volume name length must be between 1 and 63. The first character has to be a letter and the last character can't be a dash."
  }

  validation {
    condition     = var.resources != null ? (var.resources.volumes != null ? var.resources.volumes["volume_type"] == "tmfps" : true) : true
    error_message = "Volume type must be tmfps."
  }
}

variable "runtime_channel" {
  description = "(Optional) The channel of the runtime to use. Only available for some runtimes."
  type        = string
  default     = null
}

variable "beta_settings" {
  description = "(Optional) Metadata settings that are supplied to this version to enable beta runtime features."
  type        = map(any)
  default     = null
}

variable "serving_status" {
  description = "(Optional) Current serving status of this version. Only the versions with a SERVING status create instances and can be billed."
  type        = string
  default     = null

  validation {
    condition     = var.serving_status != null ? contains(["SERVING", "STOPPED"], var.serving_status) : true
    error_message = "The serving status must be one of [SERVING, STOPPED]."
  }
}

variable "api_version" {
  description = "(Optional; Default: 1)The version of the API in the given runtime environment that is used by your app. The field is deprecated for newer App Engine runtimes."
  type        = number
  default     = 1
}

variable "handlers" {
  description = "(Optional) An ordered list of URL-matching patterns that should be applied to incoming requests. The first matching URL handles the request and other request handlers are not attempted."
  type = list(object({
    url_regex                   = string,
    security_level              = string,
    login                       = string,
    auth_fail_action            = string,
    redirect_http_response_code = string,
    script = object({
      script_path = string
    })
    static_files = object({
      path                  = string,
      upload_path_regex     = string,
      http_headers          = map(string),
      mime_type             = string,
      expiration            = string,
      require_matching_file = bool,
      application_readable  = bool
    })
  }))

  validation {
    condition     = var.handlers != null ? ! contains([for security_level in var.handlers[*].security_level : (security_level == null || contains(["SECURE_DEFAULT", "SECURE_NEVER", "SECURE_OPTIONAL", "SECURE_ALWAYS"], security_level)) if security_level != null], false) : true
    error_message = "Security level field value must be one of [SECURE_DEFAULT, SECURE_NEVER, SECURE_OPTIONAL, SECURE_ALWAYS]."
  }
  validation {
    condition     = var.handlers != null ? ! contains([for login in var.handlers[*].login : (login == null || contains(["LOGIN_OPTIONAL", "LOGIN_ADMIN", "LOGIN_REQUIRED"], login)) if login != null], false) : true
    error_message = "Login field value must be one of [LOGIN_OPTIONAL, LOGIN_ADMIN, LOGIN_REQUIRED]."
  }
  validation {
    condition     = var.handlers != null ? ! contains([for auth_fail_action in var.handlers[*].auth_fail_action : (auth_fail_action == null || contains(["AUTH_FAIL_ACTION_REDIRECT", "AUTH_FAIL_ACTION_UNAUTHORIZED"], auth_fail_action)) if auth_fail_action != null], false) : true
    error_message = "Auth fail action field value must be one of [AUTH_FAIL_ACTION_REDIRECT,AUTH_FAIL_ACTION_UNAUTHORIZED]."
  }
  validation {
    condition     = var.handlers != null ? ! contains([for redirect_http_response_code in var.handlers[*].redirect_http_response_code : (redirect_http_response_code == null || contains(["REDIRECT_HTTP_RESPONSE_CODE_301", "REDIRECT_HTTP_RESPONSE_CODE_302", "REDIRECT_HTTP_RESPONSE_CODE_303", "REDIRECT_HTTP_RESPONSE_CODE_307"], redirect_http_response_code)) if redirect_http_response_code != null], false) : true
    error_message = "Redirect HTTP response code field value must be one of [REDIRECT_HTTP_RESPONSE_CODE_301, REDIRECT_HTTP_RESPONSE_CODE_302, REDIRECT_HTTP_RESPONSE_CODE_303, REDIRECT_HTTP_RESPONSE_CODE_307]."
  }
  default = null
}

variable "runtime_main_executable_path" {
  description = "(Optional) The path or name of the app's main executable."
  type        = string
  default     = null
}

variable "api_config" {
  description = "(Optional) Serving configuration for Google Cloud Endpoints."
  type = list(object({
    auth_fail_action = string,
    login            = string,
    script           = string,
    security_level   = string,
    url              = string
  }))
  default = null

  validation {
    condition     = var.api_config != null ? ! contains([for auth_fail_action in var.api_config[*].auth_fail_action : (auth_fail_action == null || contains(["AUTH_FAIL_ACTION_REDIRECT", "AUTH_FAIL_ACTION_UNAUTHORIZED"], auth_fail_action)) if auth_fail_action != null], false) : true
    error_message = "Auth fail action field value must be one of [AUTH_FAIL_ACTION_REDIRECT,AUTH_FAIL_ACTION_UNAUTHORIZED]."
  }

  validation {
    condition     = var.api_config != null ? ! contains([for login in var.api_config[*].login : (login == null || contains(["LOGIN_OPTIONAL", "LOGIN_ADMIN", "LOGIN_REQUIRED"], login)) if login != null], false) : true
    error_message = "Login field value must be one of [LOGIN_OPTIONAL, LOGIN_ADMIN, LOGIN_REQUIRED]."
  }

  validation {
    condition     = var.api_config != null ? ! contains([for security_level in var.api_config[*].security_level : (security_level == null || contains(["SECURE_DEFAULT", "SECURE_NEVER", "SECURE_OPTIONAL", "SECURE_ALWAYS"], security_level)) if security_level != null], false) : true
    error_message = "Security level field value must be one of [SECURE_DEFAULT, SECURE_NEVER, SECURE_OPTIONAL, SECURE_ALWAYS]."
  }
}

variable "env_variables" {
  description = "(Optional) Environment variables to be passed to the App Engine service."
  type        = map(any)
  default     = null
}

variable "default_expiration" {
  description = "(Optional) Duration that static files should be cached by web proxies and browsers. Only applicable if the corresponding StaticFilesHandler does not specify its own expiration time."
  type        = string
  default     = null
}

variable "nobuild_files_regex" {
  description = "(Optional) Files that match this pattern will not be built into this version. Only applicable for Go runtimes."
  type        = string
  default     = null
}
# ===== Deployment Variables ===== #
variable "zip" {
  description = "(Optional) Zip File Structure."
  type = object({
    source_url  = string,
    files_count = number
  })
  default = null
}

variable "files" {
  description = "(Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version."
  type = list(object({
    name       = string,
    sha1_sum   = string,
    source_url = string
  }))
  default = null
}

variable "container" {
  description = "(Optional) The Docker image for the container that runs the version."
  type = list(object({
    image = string
  }))
  default = null

  validation {
    condition     = var.container != null ? ! contains([for image in var.container[*].image : (image == null || length(regexall("^(eu|us|asia)?gcr.io/[[:word:]-]+/[[:word:]-]+(:[[:word:]-]+|@[[:alnum:]]+)$", image)) > 0) if image != null], false) : true
    error_message = "Security level field value must be one of [SECURE_DEFAULT, SECURE_NEVER, SECURE_OPTIONAL, SECURE_ALWAYS]."
  }
}

variable "cloud_build_options" {
  description = "(Optional) Options for the build operations performed as a part of the version deployment. Only applicable when creating a version using source code directly."
  type = list(object({
    app_yaml_path       = string
    cloud_build_timeout = string
  }))
  default = null
}
# ===== /Deployment Variables ===== #

variable "endpoints_api_service" {
  description = "(Optional) Code and application artifacts that make up this version."
  type = list(object({
    name                   = string
    config_id              = string
    rollout_strategy       = string
    disable_trace_sampling = bool
  }))
  default = null

  validation {
    condition     = var.endpoints_api_service != null ? ! contains([for rollout_strategy in var.endpoints_api_service[*].rollout_strategy : (rollout_strategy == null || contains(["FIXED", "MANAGED"], rollout_strategy)) if rollout_strategy != null], false) : true
    error_message = "Rollout strategy field value must be one of [FIXED, MANAGED]."
  }
}

variable "entrypoint" {
  description = "(Optional) The entrypoint for the application."
  type = object({
    shell = string
  })
  default = null
}

# ===== Manual Scaling Variables ===== #
variable "instances" {
  description = "(Required; Default 1) Number of instances to assign to the service at the start."
  type        = number
  default     = 1

  validation {
    condition     = var.instances > 0
    error_message = "You must allocate at least 1 instance."
  }
}
# ===== /Manual Scaling Variables ===== #

variable "noop_on_destroy" {
  description = "(Optional; Default: True)If set to true, the application version will not be deleted upon running Terraform destroy."
  type        = bool
  default     = true
}

variable "delete_service_on_destroy" {
  description = "(Optional; Default: False)If set to true, the service will be deleted if it is the last version."
  type        = bool
  default     = false
}