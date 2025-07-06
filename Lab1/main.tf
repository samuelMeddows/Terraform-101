
# terraform init
# terraform plan
# terraform apply
# terraform destroy

# Create random string
resource "random_string" "suffix" {
  length  = 6
  upper  = false
  special = false
}
# ref https://registry.terraform.io/providers/hashicorp/random/3.7.2/docs/resources/string

# Create local variables
locals {
  environment_prefix = "${var.environment_name}-${var.application_name}-${random_string.suffix.result}"
}

