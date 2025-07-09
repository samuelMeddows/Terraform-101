variable application_name {
  type = string
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