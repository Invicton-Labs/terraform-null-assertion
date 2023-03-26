// Previously, this check was done in a local. Somewhere around TF v1.4.0 though, it changed
// such that locals wouldn't be computed unless they were necessary for a resource or data source.
// Therefore, unless the "checked" output parameter was actually used somewhere in the parent module,
// the assertion check would never actually run. By putting it in a data source, it will always run
// regardless of whether any outputs of this module are used in the parent module. The `null` data
// source would be ideal, but it throws a deprecation warning. This CloudInit data source is the
// next best alternative, since it is fast and doesn't interact with the operating system at all
// (unlike an external data source, for example), and isn't deprecated.
data "cloudinit_config" "check" {
  part {
    content = var.condition ? "" : SEE_ABOVE_ERROR_MESSAGE(true ? null : "ERROR: ${var.error_message}")
  }
}
