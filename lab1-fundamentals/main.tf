
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

resource "random_string" "list" {
  count = length(var.regions)
  length  = 6
  upper   = false
  special = false
}

resource "random_string" "map" {
  for_each = var.region_instant_count
  length  = 6
  upper   = false
  special = false
}

resource "random_string" "if" {
  count = var.enabled ? 1 : 0
  length  = 6
  upper  = false
  special = false
}

module "random_module" {
  source  = "hashicorp/module/random"
  version = "1.0.0"
}
