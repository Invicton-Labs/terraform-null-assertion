terraform {
  required_version = ">= 0.13.0"
}

locals {
  content = var.condition ? "" : parseint("ERROR: ${var.error_message}", 2)
}
