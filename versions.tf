terraform {
  required_version = ">= 0.13.0"
  required_providers {
    external = {
      source  = "hashicorp/template"
      version = ">= 2.2.0"
    }
  }
}
