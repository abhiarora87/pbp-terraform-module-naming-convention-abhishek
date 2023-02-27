
variable "domain" {
  type        = string
  description = "The input value for the domain name "
  validation {
    condition     = contains(["reporting", "data", "platform", "frontend", "backend"], var.domain)
    error_message = "The only accepted values are reporting|data|platform|frontend|backend. Kindly try with those domain types"
  }
}

variable "delimiter" {
  type        = string
  description = "Input value for demlimiter other than '-' "
  default     = "-"
}

variable "environment" {
  type        = string
  description = "The input value for the aws enviornment "
  default     = ""

  validation {
    condition     = contains(["development", "production"], var.environment)
    error_message = "The only accepted values for enviornmentsare developement & production. Kindly try among those two values"
  }
}

variable "service_name" {
  type        = string
  description = "The input value of the service_name for the aws resource being created"
  default     = ""

}

variable "reordering_flag" {
  type        = bool
  description = "If set to true gives the user ability to rearrange the order of naming convention"
  default     = false
}

variable "reordering" {
  type = object({
    first_order  = string
    second_order = string
    third_order  = string

  })

  default = {
    first_order  = ""
    second_order = ""
    third_order  = ""

  }

  description = "Accepting input the reordering sequence if `reordering_flag` is true"

  validation {
    condition     = contains(["domain", "service_name", "environment"], var.reordering.first_order) && var.reordering_flag
    error_message = "The only accepted values are domain | service_name | environment and reordering_flag should be set to true . Kindly retry"
  }

  validation {
    condition     = contains(["domain", "service_name", "environment"], var.reordering.second_order) && var.reordering_flag
    error_message = "The only accepted values are domain | service_name | environment and reordering_flag should be set to true . Kindly retry"
  }

  validation {
    condition     = contains(["domain", "service_name", "environment"], var.reordering.third_order) && var.reordering_flag
    error_message = "The only accepted values are domain | service_name | environment and reordering_flag should be set to true . Kindly retry"
  }
}

