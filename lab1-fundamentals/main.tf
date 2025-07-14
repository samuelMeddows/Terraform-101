
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

  regional_stamps = {
    "foo"={
      region = "eastus"
      name   = "foo"
      min_node_count = 4
      max_node_count = 8
    },
    "bar"={
      region = "westus"
      name   = "bar"
      min_node_count = 4
      max_node_count = 8
    }
  }
}

module "regional_stamps" {
  source = "./modules/regional-stamp"

  for_each = local.regional_stamps
  
  region          = each.value.region
  name            = each.value.name
  min_node_count  = each.value.min_node_count
  max_node_count  = each.value.max_node_count
}