module "pass" {
  source = "../../"
  // Use a condition that isn't known until the apply step
  condition     = true
  error_message = "sample error: ${uuid()}"
}
