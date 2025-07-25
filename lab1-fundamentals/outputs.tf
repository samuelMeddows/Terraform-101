output "application_name" {
    value = var.application_name
}

output "environment_name"{
    value = var.environment_name
}

output "environment_prefix"{
    value = local.environment_prefix
}

output "suffix"{
    value = random_string.suffix.result
}

output "api_key" {
    value = var.api_key
    sensitive = true # This will ensure the API key is not displayed in the output
}

output "primary_region" {
    value = var.regions[0]
}

output "primary_region_instace" {
    value = var.region_instant_count[var.regions[0]]
}

output "kind" {
    value = var.sku_settings.kind
}


output "regionA" {
    value = module.regional_stamps["foo"].region
}

output "regionB" {
    value = module.regional_stamps["bar"].region
}
