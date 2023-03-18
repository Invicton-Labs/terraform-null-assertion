terraform {
  required_version = ">= 0.13.0"
  required_providers {
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = ">= 2.3.1"
    }
  }
}
