terraform {
  required_version = ">= 0.13.0"
}

locals {
  content = var.condition ? "" : abs(true ? null : "ERROR: ${var.error_message}")
}
