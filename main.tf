locals {

  lookup_value = {
    domain       = var.domain
    service_name = local.service_name_value
    enviornment  = var.environment
  }

  service_name_value = var.service_name == "" ? random_string.random.result : trimspace(var.service_name)

  ordered_resource_name = join(var.delimiter, ["pbp", lookup(local.lookup_value, var.reordering.first_order, ""), lookup(local.lookup_value, var.reordering.second_order, ""), lookup(local.lookup_value, var.reordering.third_order, "")])

  aws_resource_name = var.reordering_flag ? local.ordered_resource_name : join(var.delimiter, ["pbp", var.domain, local.service_name_value, var.environment])

  final_aws_resource_name = var.environment == "" ? trimsuffix(local.aws_resource_name, var.delimiter) : local.aws_resource_name
}

resource "random_string" "random" {
  length  = 8
  special = false
  lower   = true
}

