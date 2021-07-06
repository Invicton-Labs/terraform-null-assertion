terraform {
  required_version = ">= 0.13.0"
}

// Terraform has no built-in customizable error system, so instead we try to run a non-existant program with the error message in the name.
// It's not pretty, but it works.
data "external" "assertion" {
  count   = var.condition ? 0 : 1
  program = ["ERROR: ${var.error_message}"]
}
