variable application_name {
  description = "The name of the application"

}

# terraform plan -var "application_name=samsblog"

variable "environment_name" {

  
}

# terraform plan -var "application_name=samsblog" -var "environment_name=dev"

variable api_key{
  sensitive = true # value will not be displayed in the plan or apply output
} 