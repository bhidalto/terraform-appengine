variable "source_range" {
  description = "Required) IP address or range, defined using CIDR notation, of requests that this rule applies to."
  type        = string
  default     = ""

  validation {
    condition     = length(regexall("^[[:digit:]]{1,3}.[[:digit:]]{1,3}.[[:digit:]]{1,3}.[[:digit:]]{1,3}/[[:digit:]]{1,2}$", var.source_range)) > 0
    error_message = "The source range must be an IP address or range specified using the CIDR notation."
  }
}

variable "action" {
  description = "(Required) The action to take if this rule matches. Possible values are UNSPECIFIED_ACTION, ALLOW, and DENY."
  type        = string
  default     = ""

  validation {
    condition     = contains(["UNSPECIFIED_ACTION", "ALLOW", "DENY"], var.action)
    error_message = "Action must be one of [UNSPECIFIED_ACTION, ALLOW, DENY]."
  }
}

variable "description" {
  description = "(Optional) An optional string description of this rule."
  type        = string
  default     = null
}

variable "priority" {
  description = "(Optional) A positive integer that defines the order of rule evaluation. Rules with the lowest priority are evaluated first. A default rule at priority Int32.MaxValue matches all IPv4 and IPv6 traffic when no previous rule matches. Only the action of this rule can be modified by the user."
  type        = number
  default     = null

  validation {
    condition     = (var.priority == null ? 1 : var.priority) > 0
    error_message = "Prirority must be an integer number bigger than 1."
  }
}