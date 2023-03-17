output "checked" {
  description = "Whether the condition has been checked (used for assertion dependencies)."
  value       = data.template_file.check.rendered == "" ? true : true
}
