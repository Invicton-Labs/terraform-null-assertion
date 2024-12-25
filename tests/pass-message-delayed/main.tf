module "pass" {
  source = "../../"
  // Use a condition that isn't known until the apply step
  condition     = uuid() != ""
  error_message = uuid() == "" ? "should never happen" : "sample error"
}
