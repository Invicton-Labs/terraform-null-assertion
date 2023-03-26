variable "key1" {
  type = number
}
variable "key2" {
  type = string
}
variable "key3" {
  type = list(string)
}
variable "key4" {
  type = map(string)
}

output "key1" {
  value = var.key1
}
output "key2" {
  value = var.key2
}
output "key3" {
  value = var.key3
}
output "key4" {
  value = var.key4
}
