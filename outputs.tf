output "checked" {
  description = "Whether the condition has been checked (used for assertion dependencies)."
  value       = data.cloudinit_config.check.rendered == "" ? true : true
}
