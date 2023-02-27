output "name" {
  value = length(local.final_aws_resource_name) <= 50 ? lower(local.final_aws_resource_name) : null
}

output "total_character_exceed_flag" {
  value = length(local.final_aws_resource_name) > 50 ? true : false
}

output "name_title" {
  value = length(local.final_aws_resource_name) <= 50 ? title(local.final_aws_resource_name) : null
}

output "name_upper" {
  value = length(local.final_aws_resource_name) <= 50 ? upper(local.final_aws_resource_name) : null
}