
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
variable "reordering_1st_order" {
  type        = string
  description = "If the variable reordering_flag flag is set to true then the 1st order value "
  default     = ""

  validation {
    condition     = contains(["domain", "service_name", "environment"], var.reordering_1st_order) && var.reordering_flag
    error_message = "The only accepted values are domain | service_name | environment and reordering_flag should be set to true . Kindly retry"
  }
}

variable "reordering_2nd_order" {
  type        = string
  description = "If the variable reordering_flag flag is set to true then the 2nd order value "
  default     = ""

  validation {
    condition     = contains(["domain", "service_name", "environment"], var.reordering_2nd_order) && var.reordering_flag
    error_message = "The only accepted values are domain | service_name | environment and reordering_flag should be set to true . Kindly retry"
  }
}

variable "reordering_3rd_order" {
  type        = string
  description = "If the variable reordering_flag flag is set to true then the 3rd order value "
  default     = ""

  validation {
    condition     = contains(["domain", "service_name", "environment"], var.reordering_3rd_order) && var.reordering_flag
    error_message = "The only accepted values are domain | service_name | environment and reordering_flag should be set to true . Kindly retry"
  }
}

