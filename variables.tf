variable "error_message" {
  description = "The error message to display if the condition evaluates to `false`."
  type        = string
  nullable    = false
}

variable "condition" {
  description = "The condition to ensure is `true`."
  type        = bool
  # validation {
  #   // We have to use var.error_message != null to force the evaluation to wait
  #   // until var.error_message is known. Otherwise, it can fail during the validation
  #   // phase but won't output the proper error message.
  #   // https://github.com/hashicorp/terraform/issues/35397
  #   condition     = var.error_message == "" ? var.condition : var.condition
  #   error_message = var.error_message
  # }
}

locals {
  evaluation = var.condition ? null : SEE_ERROR_MESSAGE(var.error_message)
}
