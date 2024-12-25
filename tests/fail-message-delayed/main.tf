module "fail" {
  source = "../../"
  // Use a condition that isn't known until the apply step
  condition     = false
  error_message = uuid() == "" ? "should never happen" : "sample error"
}
