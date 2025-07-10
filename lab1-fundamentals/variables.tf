
// Application Name
# Application Name
/*
  Application Name
*/
variable application_name {
  type = string

  validation {
    condition     = length(var.application_name) > 0 
    error_message = "Application name must not be empty."
  }
}
# terraform plan -var "application_name=samsblog"

variable "environment_name" {
  type = string
}
# terraform plan -var "application_name=samsblog" -var "environment_name=dev"

variable api_key{
  type = string
  sensitive = true # value will not be displayed in the plan or apply output
} 

variable "instance_count" {
  type = number

  validation {
    condition     = var.instance_count >= local.min_nodes && var.instance_count <= local.max_nodes && var.instance_count % 2 != 0
    error_message = "Must be between 5 and 10"
  }
}

variable "enabled" {
  type = bool
}

variable "regions" {  
  type = list(string)
}

variable "region_instant_count" {
  type = map(string)
}

variable "region_set" {
  type = set(string)
}

variable "sku_settings"{
  type = object({
    kind = string
    tier = string
  })
}
