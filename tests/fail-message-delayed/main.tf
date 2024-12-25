module "fail" {
  source = "../../"
  // Use a condition that isn't known until the apply step
  condition     = false
  error_message = "sample error: ${uuid()}"
}
