output "error_message" {
  description = "The value of the `error_message` input variable."
  value       = var.error_message
}

output "condition" {
  description = "The value of the `condition` input variable."
  value       = var.condition
}

output "checked" {
  description = "Whether the condition has been checked (used for assertion dependencies)."
  value       = var.condition == true ? true : true
  //value       = local.evaluation == "" ? true : true //var.condition == true ? true : true
}
