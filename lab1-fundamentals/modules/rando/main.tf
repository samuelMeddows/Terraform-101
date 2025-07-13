resource "random_string" "this" {
  length  = var.length
  upper  = false
  special = false
}
