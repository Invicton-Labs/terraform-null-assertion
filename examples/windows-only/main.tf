module "assert_windows_only" {
  source        = "../../"
  condition     = dirname("/") == "\\"
  error_message = "This Terraform configuration can only be applied from a Windows operating system."
}
